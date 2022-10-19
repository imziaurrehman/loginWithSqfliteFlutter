import 'package:flutter/material.dart';
import 'package:signing_users_using_sqflite/auth_sqlite/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'local db',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          caption: TextStyle(
              fontSize: 16,
              fontFamily: "assets/fonts/Montserrat-Regular.ttf",
              color: Colors.black,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis),
          bodyText1: TextStyle(
              fontSize: 22,
              fontFamily: "assets/fonts/Montserrat-Bold.ttf",
              color: Colors.deepPurple,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis,
              decoration: TextDecoration.underline),
          bodyText2: TextStyle(
              fontSize: 18,
              fontFamily: "assets/fonts/Montserrat-Bold.ttf",
              color: Colors.deepPurple,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis,
              decoration: TextDecoration.underline),
          button: TextStyle(
              fontSize: 18,
              fontFamily: "assets/fonts/Montserrat-SemiBold.ttf",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginWithSqlite(),
    );
  }
}
