import 'package:flutter/material.dart';
import 'package:mobile/views/homw_view.dart';

void main() {
  runApp(const BaddilhaApp());
}

class BaddilhaApp extends StatelessWidget {
  const BaddilhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomwView(),
    );
  }
}