import 'package:flutter/material.dart';
import 'package:frontend/util/validators.dart';
import 'package:frontend/util/constants.dart';
import 'package:frontend/util/helpers.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String _errorMessage = '';


  @override
  void dispose() { // Dispose the controllers to avoid memory leaks
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose(); 
    super.dispose();
  }


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
              FormConstants.signupFormHeader,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: FormConstants.firstNameFieldLabel,
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: nameValidator,
              controller: _firstNameController,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: FormConstants.lastNameFieldLabel,
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: nameValidator,
              controller: _lastNameController,
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: FormConstants.confirmPasswordFieldLabel,
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return ValidationConstants.requiredField;
                }
                if (value?.trim() != getTextAndtrim(_passwordController)) {
                  return ValidationConstants.passwordMatchError;
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                            final url = Uri.parse(
                              PathConstants.baseURL + 
                              PathConstants.membershipController + 
                              PathConstants.signupPostActionMethod);

                            final response = await http.post(
                                url,
                                headers: <String, String>{
                                  'Content-Type': PathConstants.contentTypeHeaderValue,
                                },
                                body: jsonEncode({
                                  'firstName': getTextAndtrim(_firstNameController),
                                  'lastName': getTextAndtrim(_lastNameController),
                                  'email': getTextAndtrim(_emailController),
                                  'password': getTextAndtrim(_passwordController)
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
                FormConstants.signupButtonLabel,
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


