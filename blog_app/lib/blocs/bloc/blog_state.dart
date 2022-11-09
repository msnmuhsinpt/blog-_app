part of 'blog_bloc.dart';

class BlogState extends Equatable {
  final List<BlogModel> allBlog;


  const BlogState({this.allBlog = const <BlogModel>[]});

  @override
  List<Object> get props => [allBlog];
}
