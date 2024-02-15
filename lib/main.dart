import 'package:flutter/material.dart';
import 'package:frontend/screens/login/login_page.dart';
import 'package:frontend/screens/signup/signup_page.dart';
import 'package:frontend/util/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProductConstants.productName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        NavigationConstants.loginRoute: (context) => LoginPage(),
        NavigationConstants.signupRoute: (context) => SignupPage(),
      },
    );
  }
}
