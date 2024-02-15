import 'package:flutter/material.dart';
import 'package:frontend/screens/login/login_form.dart';
import 'package:frontend/util/constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProductConstants.productName),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              FormConstants.loginFormHeader,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo, 
              ),
            ),
            SizedBox(height: 20),
            LoginForm(),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, NavigationConstants.signupRoute);
              },
              style: TextButton.styleFrom(
                primary: Colors.indigo,
              ),
              child: Text(
                NavigationConstants.dontHaveAccount,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.indigo, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
