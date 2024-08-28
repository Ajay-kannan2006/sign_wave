import 'package:flutter/material.dart';
import 'Login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _createPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Your Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color.fromRGBO(28, 24, 41, 1),
                Color.fromRGBO(65, 55, 92, 1),
                Color.fromRGBO(101, 85, 143, 1),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth * 0.05, // 5% of the screen width
            screenHeight * 0.16, // 10% of the screen height
            screenWidth * 0.05, // 5% of the screen width
            screenHeight * 0.02, // 2% of the screen height
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple, width: 2.0))),
                  controller: _email,
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
                  },
                ),
                SizedBox(
                    height: screenHeight * 0.02), // 2% of the screen height
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple, width: 2.0))),
                  controller: _firstname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                    height: screenHeight * 0.02), // 2% of the screen height
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple, width: 2.0))),
                  controller: _lastname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                    height: screenHeight * 0.02), // 2% of the screen height
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Create Password',
                      labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple, width: 2.0))),
                  controller: _createPassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(
                    height: screenHeight * 0.02), // 2% of the screen height
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple, width: 2.0))),
                  controller: _confirmPassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _createPassword.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(
                    height: screenHeight * 0.02), // 3% of the screen height
                Text(
                  'Gender',
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Male',
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        leading: Radio<String>(
                          value: 'Male',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Female',
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        leading: Radio<String>(
                          value: 'Female',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: screenHeight * 0.04), // 4% of the screen height
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _email.clear();
                        _firstname.clear();
                        _lastname.clear();
                        _createPassword.clear();
                        _confirmPassword.clear();
                        // _selectedGender.
                        _formKey.currentState?.reset();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(191, 175, 205, 0.66),
                      ),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle sign-up action
                          String email = _email.text;
                          String firstname = _firstname.text;
                          String lastname = _lastname.text;
                          String password = _createPassword.text;
                          String confirmPassword = _confirmPassword.text;

                          print(
                              'Email: $email, First Name: $firstname, Last Name: $lastname, Password: $password, Confirm Password: $confirmPassword,Gender :$_selectedGender,');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: screenHeight * 0.04), // 4% of the screen height
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
