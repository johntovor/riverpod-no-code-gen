import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

final todoListProvider =
    AsyncNotifierProvider.autoDispose<TodoList, List<Todo>>(
  TodoList.new,
);

class TodoList extends AutoDisposeAsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    return [
      Todo(description: "Learn Flutter", completed: true),
      Todo(description: "Learn Riverpod"),
    ];
  }
}
