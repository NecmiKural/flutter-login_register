import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("user");

//TODO: password hashlenebilir
  Future<void> registerUser(
      {required String name,
      required String email,
      required String password,
      required String biography,
      required String birthdate,
      required List hobbie,
      required String uid}) async {
    await userCollection.doc(uid).set({
      "biography": biography,
      "birthdate": birthdate,
      "email": email,
      "hobbie": hobbie,
      "name": name,
      "password": password
    });
  }

  /////////////////////////////////////////////////////////////////////////////////////////

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// create user
  Future<UserModel?> signUpUser(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '',
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  /// login user

  ///signOutUser
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
