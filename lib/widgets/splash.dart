import 'package:flutter/material.dart';

Widget splash() {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.purple],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rate_rounded,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(height: 10),
        Text(
          "Splash!",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        SizedBox(height: 10),
        Center(child: CircularProgressIndicator(color: Colors.white)),
      ],
    ),
  );
}
