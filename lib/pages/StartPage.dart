import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(StartPage());

class StartPage extends StatelessWidget {
  const StartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialerScreen(),
    );
  }
}

class DialerScreen extends StatefulWidget {
  @override
  _DialerScreenState createState() => _DialerScreenState();
}

class _DialerScreenState extends State<DialerScreen> {
  String phoneNumber = '';

  void _addDigit(String digit) {
    setState(() {
      phoneNumber += digit;
    });
  }

  void _deleteDigit() {
    setState(() {
      if (phoneNumber.isNotEmpty) {
        phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
      }
    });
  }

  Future<void> _makePhoneCall() async {
    String formattedNumber = phoneNumber;

    // Add +91 prefix if it's not already included and if the number is 10 digits long
    if (phoneNumber.length == 10 && !phoneNumber.startsWith('+91')) {
      formattedNumber = '+91$phoneNumber';
    }

    // Check and request CALL_PHONE permission
    if (await Permission.phone.request().isGranted) {
      final Uri callUri = Uri(scheme: 'tel', path: formattedNumber);
      if (!await launchUrl(callUri, mode: LaunchMode.platformDefault)) {
        throw 'Could not launch $callUri';
      }
    } else {
      // Handle permission denied
      print('CALL_PHONE permission not granted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              phoneNumber,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index < 9) {
                  return _buildKey((index + 1).toString());
                } else if (index == 9) {
                  return _buildKey('*');
                } else if (index == 10) {
                  return _buildKey('0');
                } else {
                  return _buildKey('#');
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.backspace, color: Colors.red, size: 30),
                onPressed: () {
                  if (phoneNumber.isNotEmpty) {
                    _deleteDigit();
                  }
                },
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: phoneNumber.isNotEmpty ? _makePhoneCall : null,
                icon: Icon(Icons.call),
                label: Text('Call'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildKey(String digit) {
    return InkWell(
      onTap: () {
        _addDigit(digit);
      },
      child: Center(
        child: Text(
          digit,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
