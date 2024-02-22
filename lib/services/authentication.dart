import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("user");

  Future<void> registerUser(
      {required String name,
      required String email,
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
    });
  }
}
