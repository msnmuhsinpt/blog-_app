import 'dart:io';

class BlogModel {
  final int? id;
  final String tittle;
  final String content;
  final File? image;

  const BlogModel({
    this.id,
    required this.tittle,
    required this.content,
    this.image,
  });
  }
/*

  BlogModel copyWith({
    int? id,
    String? tittle,
    String? content,
    String? image,
  }) {
    return BlogModel(
      id: id ?? this.id,
      tittle: tittle ?? this.tittle,
      content: content ?? this.content,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tittle': tittle,
      'content': content,
      'image': image,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] != null ? map['id'] as int : null,
      tittle: map['tittle'] as String,
      content: map['content'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        tittle,
        content,
        image,
      ];
}
*/
