import 'package:flutter/material.dart';
import '/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF212529),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF6C757D),
          surface: const Color(0xFF343A40),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}