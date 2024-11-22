class NoteModel {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });

  static String generateId() => DateTime.now().millisecondsSinceEpoch.toString();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> data) {
    return NoteModel(
      id: data['id'] ?? '',
      title: data['title'] ?? 'Untitled',
      content: data['content'] ?? '',
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: data['updatedAt'] != null
          ? DateTime.parse(data['updatedAt'])
          : null,
    );
  }
}
