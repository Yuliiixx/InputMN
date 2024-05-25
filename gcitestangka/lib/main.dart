import 'package:flutter/material.dart';
import 'package:gcitestangka/homepage.dart';  

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test GCI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: HomePage(),  
      debugShowCheckedModeBanner: false,
    );
  }
}
