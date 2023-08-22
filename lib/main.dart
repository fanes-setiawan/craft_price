import 'package:craft_product/core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: LoginView(),
    );
  }
}