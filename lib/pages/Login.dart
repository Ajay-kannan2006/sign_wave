import 'package:flutter/material.dart';
import 'package:sign_wave/components/BackArrowButton.dart';
// import 'dart:math' as math;

class Login extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          children: <Widget>[
            // Background Gradient
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.4, // 40% of the screen height
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromRGBO(101, 85, 143, 1),
                      Color.fromRGBO(78, 59, 129, 1),
                      Color.fromRGBO(28, 24, 41, 1),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.072,
              left: 16.0,
              child: BackArrowButton(
                iconColor: Colors.white,
                backgroundColor:
                    Colors.transparent, // Optional background color
              ),
            ),
            // "Enter Your Details" Text
            Positioned(
              top: screenHeight * 0.08, // 8% of the screen height
              left: screenWidth * 0.22, // 22% of the screen width
              child: Text(
                'Enter Your Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: screenWidth * 0.07, // 7% of the screen width
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            // Image Below Text
            Positioned(
              top: screenHeight * 0.1, // 20% of the screen height
              left: screenWidth * 0.08, // 8% of the screen width
              child: Container(
                width: screenWidth * 0.84, // 84% of the screen width
                height: screenHeight * 0.34, // 34% of the screen height
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'lib/Assets/Whatsapp_image_20240822_at_210822removebgpreview3.png',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            // Form with Email and Password Fields
            Positioned(
              top: screenHeight * 0.45, // 55% of the screen height
              left: screenWidth * 0.05, // 3% of the screen width
              right: screenWidth * 0.05, // 3% of the screen width
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: screenHeight * 0.01), // 1% of the screen height
                    // Email TextFormField
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2.0))),
                      // controller: _firstname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                        // return null;
                      },
                    ),
                    // ),
                    SizedBox(
                        height: screenHeight * 0.04), // 2% of the screen height
                    // Password Label
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2.0))),
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Discard Button
            Positioned(
              top: screenHeight * 0.77, // 82% of the screen height
              left: screenWidth * 0.05, // 5% of the screen width
              child: GestureDetector(
                onTap: () {
                  _formKey.currentState!.reset();
                  _emailController.clear();
                  _passwordController.clear();
                },
                child: Container(
                  width: screenWidth * 0.35, // 35% of the screen width
                  height: screenHeight * 0.07, // 7% of the screen height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(191, 175, 206, 0.66),
                  ),
                  child: Center(
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: screenWidth * 0.05, // 5% of the screen width
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Login Button
            Positioned(
              top: screenHeight * 0.77, // 82% of the screen height
              left: screenWidth * 0.58, // 58% of the screen width
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    // Handle the login logic with the collected data

                    print('Email: $email, Password: $password');
                  }
                },
                child: Container(
                  width: screenWidth * 0.35, // 35% of the screen width
                  height: screenHeight * 0.07, // 7% of the screen height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(78, 66, 110, 1),
                  ),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: screenWidth * 0.05, // 5% of the screen width
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
