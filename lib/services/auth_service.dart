import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  Future<User?> signUp(String fullName, String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      if (user != null) {
        // Create user model
        final newUser = UserModel(
          uid: user.uid,
          fullName: fullName,
          email: email,
        );
        // Save to Firestore collection "users"
        await _firestore.collection('users').doc(user.uid).set(newUser.toMap());
      }
      return user;
    } catch (e) {
      print("Signup Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
