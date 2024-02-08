// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// final _firebase = FirebaseAuth.instance;

// class authScreen extends StatefulWidget {
//   const authScreen({super.key});
//   @override
//   State<StatefulWidget> createState() {
//     return authScreenState();
//   }
// }

// class authScreenState extends State<authScreen> {
//   final _from = GlobalKey<FormState>();
//   var _isLogin = true;
//   var _emailAddress = '';
//   var _password = '';

//   void _submit() async {
//     final isValid = _from.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     _from.currentState!.save();
//     try {
//       if (_isLogin) {
//         final userCredentials = await _firebase.signInWithEmailAndPassword(
//             email: _emailAddress, password: _password);
//       } else {
//         final userCredentials = await _firebase.createUserWithEmailAndPassword(
//             email: _emailAddress, password: _password);
//       }
//     } on FirebaseAuthException catch (error) {
//       if (error.code == 'email-already-in-use') {
//         //...
//       }
//       ScaffoldMessenger.of(context).clearSnackBars();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(error.message ?? 'authentication Failed'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.primary,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(
//                   top: 30,
//                   left: 20,
//                   bottom: 20,
//                   right: 20,
//                 ),
//                 width: 200,
//                 child: Image.asset('assets/chatting.png'),
//               ),
//               Card(
//                 margin: EdgeInsets.all(20),
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Form(
//                         key: _from,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             TextFormField(
//                               decoration: const InputDecoration(
//                                 labelText: 'enter email',
//                               ),
//                               keyboardType: TextInputType.emailAddress,
//                               autocorrect: false,
//                               textCapitalization: TextCapitalization.none,
//                               validator: (value) {
//                                 if (value == null ||
//                                     value.trim().isEmpty ||
//                                     !value.contains('@')) {
//                                   return 'pls enter a valid email';
//                                 }
//                                 return null;
//                               },
//                               onSaved: (value) {
//                                 _emailAddress = value!;
//                               },
//                             ),
//                             TextFormField(
//                               decoration: const InputDecoration(
//                                 labelText: 'enter password',
//                               ),
//                               obscureText: true,
//                               validator: (value) {
//                                 if (value == null || value.trim().length < 6) {
//                                   return ' enter password is must be <6';
//                                 }
//                                 return null;
//                               },
//                               onSaved: (value) {
//                                 _password = value!;
//                               },
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             ElevatedButton(
//                                 onPressed: _submit,
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Theme.of(context)
//                                       .colorScheme
//                                       .primaryContainer,
//                                 ),
//                                 child: Text(
//                                   _isLogin ? 'login' : 'Signup',
//                                 )),
//                             TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _isLogin = !_isLogin;
//                                   });
//                                 },
//                                 child: Text(_isLogin
//                                     ? 'dont have an account'
//                                     : 'alredy have an account')),
//                           ],
//                         )),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
