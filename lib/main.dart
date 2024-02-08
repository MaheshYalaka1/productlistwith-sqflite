import 'package:app_notification/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorScheme = ColorScheme.fromSeed(
    // brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 6, 247, 42),
    background: Color.fromARGB(0, 236, 230, 245));

// final Theme = ThemeData().copyWith(
//     scaffoldBackgroundColor: colorScheme.background,
//     colorScheme: colorScheme,
//     textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
//       titleSmall: GoogleFonts.ubuntuCondensed(
//         fontWeight: FontWeight.bold,
//       ),
//       titleMedium: GoogleFonts.ubuntuCondensed(
//         fontWeight: FontWeight.bold,
//       ),
//       titleLarge: GoogleFonts.ubuntuCondensed(
//         fontWeight: FontWeight.bold,
//       ),
//     ));

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " my place",
      home: const PlacesScreen(),
    );
  }
}
