class Activity {
  final String activity;
  final String type;
  final int participants;
  final dynamic price;
  final String key;

  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.key,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json["activity"] as String,
      type: json["type"] as String,
      participants: json["participants"] as int,
      price: json["price"] as dynamic,
      key: json["key"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "activity": activity,
      "type": type,
      "participants": participants,
      "price": price,
      "key": key,
    };
  }
}
