import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home_page.dart';
import 'providers/activity_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final helloWorldProvider = Provider((_) => "Hello Riverpod");

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(activityProvider);
    return MaterialApp(
      title: 'Riverpod Mastery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Riverpod Mastery"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                ref.refresh(activityProvider.future);
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
