import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_and_register_app/screens/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = 'main screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Column(
              children: [
                Center(child: Text("Home Page")),
              ],
            );
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
