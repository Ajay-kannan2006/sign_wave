// import 'package:flutter/material.dart';
// import 'package:flutter_sms/flutter_sms.dart';

// // class SMSApp extends StatelessWidget {
//   const SMSApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SMSHomePage(),
//     );
//   }
// }

// class SMSHomePage extends StatefulWidget {
//   @override
//   _SMSHomePageState createState() => _SMSHomePageState();
// }

// class _SMSHomePageState extends State<SMSHomePage> {
//   String message = "";
//   String recipient = "";

//   void _sendSMS() async {
//     try {
//       await sendSMS(
//         message: message,
//         recipients: [recipient],
//       );
//       print("SMS Sent");
//     } catch (error) {
//       print("Failed to send SMS: $error");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("SMS App")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: "Recipient"),
//               onChanged: (val) {
//                 setState(() {
//                   recipient = val;
//                 });
//               },
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: "Message"),
//               onChanged: (val) {
//                 setState(() {
//                   message = val;
//                 });
//               },
//             ),
//             ElevatedButton(
//               onPressed: _sendSMS,
//               child: Text("Send SMS"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
