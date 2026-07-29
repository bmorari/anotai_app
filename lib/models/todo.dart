class Todo {
  Todo({required this.title, required this.dateTime, this.completed = false});

  Todo.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      dateTime = DateTime.parse(json['dateTime']),
      completed = json['completed'] ?? false;

  String title;
  DateTime dateTime;
  bool completed = false;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dateTime': dateTime.toIso8601String(),
      'completed': completed,
    };
  }
}
