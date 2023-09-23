import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todolist/components/square_tile.dart';
import 'package:todolist/constants/colors.dart';
import 'package:todolist/screens/group_task_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      // Chuyển hướng đến màn hình khác sau 5 giây
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => listview_grouptask()),
      );
    });
    return Scaffold(
      backgroundColor: bglight,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const SquareTile(
                imagePath: 'assets/images/tea.jpeg',
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Welcome to tea do list!',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),

              //const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
