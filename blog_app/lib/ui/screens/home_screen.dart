import 'package:blog_app/core/constance.dart';
import 'package:blog_app/widget/app_text_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.jimdo.com/static/aa9b0ad5588fb6a5d8fe7932f0e70ee6/342bf/travel-hero.jpg',
                  ),
                ),
              ),
            ),
            appTextView(name: "My Travel Diary", isBold: true, size: 17),
            dividerSH(),
            appTextView(
                name:
                    'When New York City restaurateur Judi Wong was looking for a post-Covid, back-to-Europe (but someplace new) summer getaway with her college-aged son Marley, all signs pointed to Portugal. Here’s what they did on their crash-course around the country.',
                maxLines: 6),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
