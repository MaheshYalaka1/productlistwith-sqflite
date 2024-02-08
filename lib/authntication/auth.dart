// import 'package:flutter/material.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});
//   @override
//   State<AuthScreen> createState() {
//     return _AuthScreenState();
//   }
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final _from = GlobalKey<FormState>();

//   var _isLogin = true;
//   var _enterdemail = '';
//   var _enterdpassword = '';

//   void _Submit() {
//     final isValid = _from.currentState!.validate();
//     if (isValid) {
//       _from.currentState!.save();
//       print(_enterdemail);
//       print(_enterdpassword);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.primary,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(
//                   top: 30,
//                   left: 20,
//                   right: 20,
//                   bottom: 20,
//                 ),
//                 width: 200,
//                 child: Image.asset(
//                   "assets/images/chat.png",
//                 ),
//               ),
//               Card(
//                 margin: const EdgeInsets.all(30),
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(26),
//                     child: Form(
//                       key: _from,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           TextFormField(
//                             decoration:
//                                 const InputDecoration(labelText: 'enter email'),
//                             keyboardType: TextInputType.emailAddress,
//                             autocorrect: false,
//                             textCapitalization: TextCapitalization.none,
//                             validator: (value) {
//                               if (value == null ||
//                                   value.trim().isEmpty ||
//                                   !value.contains('@')) {
//                                 return "please enter a valid email";
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               _enterdemail = value!;
//                             },
//                           ),
//                           TextFormField(
//                             decoration:
//                                 const InputDecoration(labelText: 'password'),
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.trim().length < 6) {
//                                 return "passwrd at least length 6 charecters long";
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               _enterdpassword = value!;
//                             },
//                           ),
//                           const SizedBox(
//                             height: 12,
//                           ),
//                           ElevatedButton(
//                             onPressed: _Submit,
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Theme.of(context)
//                                     .colorScheme
//                                     .primaryContainer),
//                             child: Text(_isLogin ? 'login' : 'signUp'),
//                           ),
//                           TextButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _isLogin = !_isLogin;
//                                 });
//                               },
//                               child: Text(_isLogin
//                                   ? 'create an account'
//                                   : 'alredy have an account'))
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
