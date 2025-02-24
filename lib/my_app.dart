import 'package:flutter/material.dart';
import 'package:test_api/body_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: BodyApp()),
    );
  }
}
