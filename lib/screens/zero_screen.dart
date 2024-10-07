import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/screens/first_screen.dart';

class ZeroScreen extends StatefulWidget {
  const ZeroScreen({super.key});

  @override
  State<ZeroScreen> createState() => _ZeroScreenState();
}

class _ZeroScreenState extends State<ZeroScreen> {
  void _go_to_next_page_fun() {
    Get.to(const FirstScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _go_to_next_page_fun();
            },
            child: const Text('Go To Next Page')),
      ),
    );
  }
}
