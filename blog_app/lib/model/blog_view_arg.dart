import 'dart:io';

class BlogModelArg {
  int id;
  String title;
  String content;
  File? imageUrl;

  BlogModelArg(
      {required this.id,
      required this.title,
      required this.content,
      required this.imageUrl});
}
