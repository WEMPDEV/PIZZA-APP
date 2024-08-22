// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:bookverse/Models/users.dart';
// import 'package:bookverse/Services/userService.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';
//
// class ProfileDetailsScreen extends StatefulWidget {
//   const ProfileDetailsScreen({super.key});
//
//   @override
//   State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
// }
//
// class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
//   final User? user = FirebaseAuth.instance.currentUser;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController shippingAddressController = TextEditingController();
//   String gender = 'Select';
//
//   final UserService usersFirestore = UserService(); // Instance of UsersFirestore
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     shippingAddressController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _updateUserProfile() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       if (user != null) {
//         try {
//           // Create an updated UserModel
//           UserModel updatedUser = UserModel(
//             id: user!.uid,
//             name: nameController.text,
//             email: emailController.text,
//             phone: phoneController.text,
//             photoURL: user?.photoURL ?? '',
//             createdAt: DateTime.now(), // This can be fetched from Firestore if needed
//           );
//
//           // Update the user in Firestore
//           await usersFirestore.updateUser(user!.uid, updatedUser.toMap());
//
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Profile updated successfully')),
//           );
//         } catch (e) {
//           print('Error updating profile: $e');
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to update profile')),
//           );
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Profile'),
//         backgroundColor: Color(0xFF4A90E2), // Primary Color
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 20),
//               Center(
//                 child: Stack(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Color(0xFFFFFFFF), // Secondary Color
//                       child: Icon(Icons.person, size: 50, color: Color(0xFF4A90E2)), // Primary Color
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: CircleAvatar(
//                         radius: 15,
//                         backgroundColor: Color(0xFFF5A623), // Accent Color
//                         child: Icon(Icons.edit, size: 15, color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               _buildTextField(controller: nameController, label: 'Name'),
//               SizedBox(height: 20),
//               _buildTextField(
//                 controller: phoneController,
//                 label: 'Phone Number',
//                 suffix: TextButton(
//                   onPressed: () {
//                     // Handle change phone number
//                   },
//                   child: Text('Change', style: TextStyle(color: Color(0xFF4A90E2))), // Primary Color
//                 ),
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 keyboardType: TextInputType.phone,
//               ),
//               SizedBox(height: 20),
//               _buildTextField(
//                 controller: emailController,
//                 label: 'Email',
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Please enter a valid email address';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               _buildTextField(controller: shippingAddressController, label: 'Shipping Address'),
//               SizedBox(height: 20),
//               DropdownButtonFormField<String>(
//                 value: gender,
//                 items: <String>['Select', 'Male', 'Female', 'Other']
//                     .map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     gender = newValue ?? 'Select';
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Gender',
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xFF4A90E2)), // Primary Color
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//                 validator: (value) {
//                   if (value == 'Select') {
//                     return 'Please select your gender';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 100),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF4A90E2), // Primary Color
//                   minimumSize: Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: _updateUserProfile,
//                 child: const Text('Update', style: TextStyle(fontSize: 24, color: Colors.white)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   TextFormField _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     Widget? suffix,
//     List<TextInputFormatter>? inputFormatters,
//     TextInputType keyboardType = TextInputType.text,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: Color(0xFF4A90E2)), // Primary Color
//         ),
//         filled: true,
//         fillColor: Color(0xFFFFFFFF), // Secondary Color
//         suffix: suffix,
//       ),
//       inputFormatters: inputFormatters,
//       keyboardType: keyboardType,
//       validator: validator,
//     );
//   }
// }
//
// /// this is the profile detail screen