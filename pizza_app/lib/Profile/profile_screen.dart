// // ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, unused_import
// import 'dart:io';
// import 'package:bookverse/Login/faqPage.dart';
// import 'package:bookverse/Login/loginpage.dart';
// import 'package:bookverse/Login/payment/pay_method_screen.dart';
// import 'package:bookverse/Login/profilePages/detailed_profile_screen.dart';
// import 'package:bookverse/Users/Screens/homeScreen.dart';
// import 'package:bookverse/Users/Utils/buttomNavigation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ProfileScreen extends StatefulWidget {
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   final user = FirebaseAuth.instance.currentUser;
//   File? _image;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Color(0xFF4A90E2), // Primary Color
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => bottomNav(user: user!),
//               ),
//             );
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Stack(
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Color(0xFFFFFFFF), // Secondary Color
//                   backgroundImage: _image != null
//                       ? FileImage(_image!)
//                       : user?.photoURL != null
//                       ? NetworkImage(user!.photoURL!)
//                       : null,
//                   child: user?.photoURL == null
//                       ? Icon(Icons.person,
//                       size: 50, color: Color(0xFFF5A623)) // Accent Color
//                       : null,
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: CircleAvatar(
//                     radius: 15,
//                     backgroundColor: Color(0xFFF5A623), // Accent Color
//                     child: IconButton(
//                       icon: Icon(Icons.edit, size: 15, color: Colors.white),
//                       onPressed: () {
//                         _showPicker(context);
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               user?.displayName ?? 'No Name', // Fallback if displayName is null
//               style: TextStyle(
//                   fontSize: 20, fontWeight: FontWeight.bold), // Primary Color
//             ),
//             SizedBox(height: 30),
//             _buildListTile(context, Icons.person, 'Your profile', () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfileDetailsScreen()),
//               );
//             }),
//             _buildListTile(context, Icons.payment, 'Payment Methods', () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PaymentMethodsScreen()),
//               );
//             }),
//             _buildListTile(context, Icons.help_center, 'FAQ', () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => FAQPage()),
//               );
//             }),
//             _buildListTile(context, Icons.logout, 'Log out', () async {
//               try {
//                 await GoogleSignIn().signOut();
//                 FirebaseAuth.instance.signOut();
//                 FacebookAuth.instance.logOut();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyLogin()),
//                 );
//               } catch (e) {
//                 print('Error signing out : $e');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Error signing out')),
//                 );
//               }
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildListTile(
//       BuildContext context, IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: Color(0xFF4A90E2)), // Primary Color
//       title: Text(title),
//       trailing: Icon(Icons.chevron_right),
//       onTap: onTap,
//     );
//   }
//
//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   void _showPicker(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                   leading: Icon(Icons.photo_library,
//                       color: Color(0xFF4A90E2)), // Primary Color
//                   title: Text('Photo Library'),
//                   onTap: () {
//                     _pickImage(ImageSource.gallery);
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.photo_camera,
//                       color: Color(0xFF4A90E2)), // Primary Color
//                   title: Text('Camera'),
//                   onTap: () {
//                     _pickImage(ImageSource.camera);
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           );
//           },
//     );
//     }
// }