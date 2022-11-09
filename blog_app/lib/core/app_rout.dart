// Cupertino page route
import 'package:flutter/cupertino.dart';

import '../model/blog_view_arg.dart';
import '../ui/add_blog/screen/add_blog_screen.dart';
import '../ui/blog_view/screen/blog_view_screen.dart';
import '../ui/home/screen/home_screen.dart';
import '../ui/splash/splash_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  Route page = CupertinoPageRoute(builder: (context) => const SplashScreen());
  switch (settings.name) {
    case "/splash":
      page = CupertinoPageRoute(builder: (context) => const SplashScreen());
      break;
    case "/home":
      page = CupertinoPageRoute(
        builder: (context) => const HomeScreen(),
      );
      break;
    case "/blogView":
      final arguments = settings.arguments as BlogModelArg;

      page = CupertinoPageRoute(
        builder: (context) => BlogViewScreen(arguments.id.toString(),
            arguments.title, arguments.imageUrl, arguments.content),
      );
      break;
    case "/blogAdd":
      page = CupertinoPageRoute(
        builder: (context) => const AddBlogScreen(),
      );
      break;
  }
  return page;
}
