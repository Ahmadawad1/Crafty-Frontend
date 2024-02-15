import 'package:flutter/material.dart';
import 'package:frontend/screens/signup/signup_form.dart';
import 'package:frontend/util/constants.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProductConstants.productName),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignupForm(),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, NavigationConstants.loginRoute);
                },
                style: TextButton.styleFrom(
                  primary: Colors.indigo,
                ),
                child: Text(
                  NavigationConstants.alreadyHaveAccount,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
