import 'package:flutter/material.dart';
import 'login/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RMN 0004-0138-0139',
      home: SignInScreen(),
    );
  }
}
