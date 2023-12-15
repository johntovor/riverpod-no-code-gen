import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/activity.dart';
import '../providers/activity_provider.dart';
import 'activity_screen.dart';
import 'add_region.dart';
import 'region_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final AsyncValue<Activity> activity = ref.watch(activityProvider);

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: switch (activity) {
              AsyncData(:final value) => Text("Activity: ${value.activity}"),
              AsyncError() => const Text('Ooops, something went wrong!'),
              _ => const CircularProgressIndicator(),
            },
          ),
          const SizedBox(height: 5.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddRegion(),
                ),
              );
            },
            child: const Text("Add Region Screen"),
          ),
          const SizedBox(height: 5.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegionListScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: const Text("Region List"),
          ),
          const SizedBox(height: 5.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ActivityScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: const Text("Activity"),
          ),
        ],
      );
    });
  }
}
