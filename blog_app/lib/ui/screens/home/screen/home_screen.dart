import 'package:blog_app/blocs/bloc_explore.dart';
import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/ui/screens/home/widget/home_main_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        List<BlogModel> blogList = state.allBlog;

        return Scaffold(
          body: HomeMainCard(blogList: blogList),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, "/blogAdd");
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
