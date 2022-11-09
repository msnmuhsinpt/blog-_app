import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/blog_model.dart';

part 'blog_event.dart';

part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  late BlogModel blog;
  int id = 0;

  BlogBloc() : super(const BlogState()) {
    on<AddBlog>(_onAddBlog);
    on<UpdateBlog>(_onUpdateBlog);
    on<DeleteBlog>(_onDeleteBlog);
  }

  void _onAddBlog(AddBlog event, Emitter<BlogState> emit) {
    final state = this.state;

    emit(BlogState(
      allBlog: List.from(state.allBlog)..add(event.blogModel),
    ));
  }

  void _onUpdateBlog(UpdateBlog event, Emitter<BlogState> emit) {
    final state = this.state;
    emit(BlogState(
      allBlog: List.from(state.allBlog)..add(event.blogModel),
    ));
  }

  void _onDeleteBlog(DeleteBlog event, Emitter<BlogState> emit) {
    final state = this.state;
    emit(BlogState(
      allBlog: List.from(state.allBlog)..add(event.blogModel),
    ));
  }
}
