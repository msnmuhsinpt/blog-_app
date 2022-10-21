import 'package:blog_app/ui/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: "/splash",
    );
  }
}

// cupertuno page route
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
  }
  return page;
}
