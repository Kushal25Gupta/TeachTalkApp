import 'package:teachtool/Resources/Routes/Routes_Names.dart';
import 'package:teachtool/Utils/Utils.dart';
import 'package:teachtool/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthServices {
  static signupUser(String email, String password) async {
    try {
      UserCredential userCredential = await fireAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Email Provided already Exists');
      } else {
        throw Exception('Please try again later.');
      }
    } catch (e) {
      throw Exception('Please try again later.');
    }
  }

  static signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Utils.successSnackBar("Logged-In", "Successfully Logged IN");
      Get.offAllNamed(RoutesNames.navigationBar);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found with this email');
      } else if (e.code == 'wrong-password') {
        throw Exception('Password did not match');
      } else {
        throw Exception(e.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      Get.back();
    }
  }

  getCurrentUser() {
    return fireAuth.currentUser!;
  }
}
