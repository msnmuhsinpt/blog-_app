import 'package:blog_app/model/blog_view_arg.dart';
import 'package:blog_app/ui/screens/add_blog/screen/add_blog_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'blocs/bloc_explore.dart';
import 'ui/screens/blog_view/screen/blog_view_screen.dart';
import 'ui/screens/home/screen/home_screen.dart';
import 'ui/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: "/splash",
        builder: EasyLoading.init(),
      ),
    );
  }
}

// Cupertino page route
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
