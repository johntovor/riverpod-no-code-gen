class Todo {
  final String description;
  final bool? completed;

  Todo({required this.description, this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      description: json["description"] as String,
      completed: json["completed"] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "completed": completed ?? false,
    };
  }
}
