class CommentModel {
  final String name;
  final String content;
  final String imageUrl;

//<editor-fold desc="Data Methods">

  const CommentModel({
    required this.name,
    required this.content,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          content == other.content &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode => name.hashCode ^ content.hashCode ^ imageUrl.hashCode;

  @override
  String toString() {
    return 'CommentModel{' +
        ' name: $name,' +
        ' content: $content,' +
        ' imageUrl: $imageUrl,' +
        '}';
  }

  CommentModel copyWith({
    String? name,
    String? content,
    String? imageUrl,
  }) {
    return CommentModel(
      name: name ?? this.name,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'content': this.content,
      'imageUrl': this.imageUrl,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      name: map['name'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

//</editor-fold>
}
