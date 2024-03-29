// import 'package:architecture_flutter/firebase_options.dart';
// import 'package:architecture_flutter/screens/auth.dart';
// import 'package:architecture_flutter/screens/chat.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter chat',
//       theme: ThemeData().copyWith(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color.fromARGB(255, 63, 17, 177),
//         ),
//       ),
//       home: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (ctx, snapshot) {
//           if (snapshot.hasData) {
//             return const chatState();
//           }
//           return const authScreen();
//         },
//       ),
//     );
//   }
// }
