part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

//create blog
class AddBlog extends BlogEvent {
  final BlogModel blogModel;
  const AddBlog({
    required this.blogModel,
  });

  @override
  List<Object> get props => [];
}

//update blog
class UpdateBlog extends BlogEvent {
  final BlogModel blogModel;
  const UpdateBlog({
    required this.blogModel,
  });

  @override
  List<Object> get props => [];
}

//delete Blog
class DeleteBlog extends BlogEvent {
  final BlogModel blogModel;
  const DeleteBlog({
    required this.blogModel,
  });

  @override
  List<Object> get props => [];
}
