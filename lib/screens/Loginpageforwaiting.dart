// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todolist/components/square_tile.dart';
import 'package:todolist/constants/colors.dart';

class LoginPagewaiting extends StatelessWidget {
  const LoginPagewaiting({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
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
