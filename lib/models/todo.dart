class Todo {
  final int id;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;

  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.updatedAt = '',
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
