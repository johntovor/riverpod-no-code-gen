import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/activity.dart';
import '../providers/activity_provider.dart';

class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pull To Refresh"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(activityProvider.future),
        child: ListView(
          children: [
            switch (activity) {
              AsyncValue<Activity>(:final valueOrNull?) =>
                Text(valueOrNull.activity),
              AsyncValue(:final error?) => Text("Error: $error"),
              _ => const CircularProgressIndicator(),
            }
          ],
        ),
      ),
    );
  }
}
