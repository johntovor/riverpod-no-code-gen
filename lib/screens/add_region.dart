import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_doc/models/region.dart';

import '../providers/region_provider.dart';

class AddRegion extends ConsumerStatefulWidget {
  const AddRegion({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddRegionState();
}

class _AddRegionState extends ConsumerState<AddRegion> {
  Future<void>? _pendingAddRegion;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Region"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _pendingAddRegion,
        builder: ((context, snapshot) {
          final isErrored = snapshot.hasError &&
              snapshot.connectionState != ConnectionState.waiting;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                Material(
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Region name",
                    ),
                    onSubmitted: (value) => "",
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final future = ref
                            .read(regionListProvider.notifier)
                            .addRegion(Region(name: nameController.text));
                        setState(() {
                          _pendingAddRegion = future;
                        });
                        nameController.clear();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          isErrored ? Colors.red : null,
                        ),
                      ),
                      child: const Text("Add Region"),
                    ),
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) ...[
                      const SizedBox(width: 8.0),
                      const CircularProgressIndicator(),
                    ]
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
