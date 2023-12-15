import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/region_provider.dart';

class RegionListScreen extends ConsumerStatefulWidget {
  const RegionListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegionListScreenState();
}

class _RegionListScreenState extends ConsumerState<RegionListScreen> {
  late Future _future;


  @override
  Widget build(BuildContext context) {
    _future = ref.watch(regionListProvider.notifier).getRegions();
    // ref.watch(regionListProvider.notifier).getRegions();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Regions"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // title: Text(snapshot.data.),
                      title: Text(snapshot.data[index].name),
                      subtitle:
                          Text(snapshot.data[index].dateAdded.substring(0, 10)),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("An error occurred: ${snapshot.error}");
              } else {
                return const Text("No data available");
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return const Text("Unexpected connection state");
            }
          },
        ),
      ),
    );
  }
}
