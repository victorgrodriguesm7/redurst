
import 'package:flutter/material.dart';
import 'package:redrust/src/shared/models/auth_model.dart';

class HomePage extends StatefulWidget {
  final AuthModel auth;
  const HomePage({Key? key, required this.auth }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You are logged with ${widget.auth.accessToken}")
          ],
        ),
      ),
    );
  }
}
