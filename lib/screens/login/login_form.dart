import 'package:flutter/material.dart';
import 'package:frontend/util/constants.dart';
import 'package:frontend/util/validators.dart';
import 'package:frontend/util/helpers.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();  
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
       child: Form(
        key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            FormConstants.loginFormHeader,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo, 
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: FormConstants.emailFieldLabel,
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            validator: emailValidator,
            controller: _emailController,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: FormConstants.passwordFieldLabel,
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(), 
            ),
            obscureText: true,
            validator: passwordValidator,
            controller: _passwordController,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
             if (_formKey.currentState?.validate() ?? false) {
                      final url = Uri.parse(
                        PathConstants.baseURL + 
                        PathConstants.membershipController + 
                        PathConstants.signinPostActionMethod);

                      final response = await http.post(
                          url,
                          headers: <String, String>{
                            'Content-Type': PathConstants.contentTypeHeaderValue,
                          },
                          body: jsonEncode({
                            'email': getTextAndtrim(_emailController),
                            'password': getTextAndtrim(_passwordController),
                          }),
                      );
                      setState(() {
                          _errorMessage = handleResponse(response.statusCode);
                          if (_errorMessage.isEmpty) {
                            //Route to Home
                          }
                      });
                }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white, 
            ),
            child: Text(
              FormConstants.loginButtonLabel,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (_errorMessage.isNotEmpty) // Display error message if not empty
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                ),
              ),
        ],
      ),
      ),
    );
  }
}