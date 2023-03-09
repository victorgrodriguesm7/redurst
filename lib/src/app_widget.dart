
import 'package:flutter/material.dart';
import 'package:redrust/src/screens/home/home_page_widget.dart';
import 'package:redrust/src/screens/login/login_page_widget.dart';
import 'package:redrust/src/shared/models/auth_model.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AuthModel auth = AuthModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes:  {
        "/": (_) =>  LoginPage(auth: auth),
        "/home": (_) => HomePage(auth: auth)
      },
    );
  }
}