import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/screens/first_screen.dart';
import 'package:test_app/screens/zero_screen.dart';


void main(){
  runApp(const RunMyApp());
}


class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: ZeroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
