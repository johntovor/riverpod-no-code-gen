class Region {
  final int? id;
  final String name;
  final String? date_added;

  Region({
    this.id,
    required this.name,
    this.date_added,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'] as int?,
      name: json['name'] as String,
      date_added: json['date_added'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "date_added": date_added,
    };
  }
}
