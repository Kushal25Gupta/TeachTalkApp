import 'package:teachtool/Repository/Services/AuthService/auth_Service.dart';
import 'package:teachtool/Resources/Colors/App_Colors.dart';
import 'package:teachtool/Resources/Components/Custom_Dialog.dart';
import 'package:teachtool/Resources/Routes/Routes_Names.dart';
import 'package:teachtool/ViewModel/AuthController/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/Email_Text_Field.dart';
import 'components/Password_Text_Field.dart';
import '../../Resources/Components/Buttons/Round_Button.dart';
import '../../Utils/Utils.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool login = true;
  final _formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.put(AuthController());

  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailEditingController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordEditingController = TextEditingController();

  Future<void> handlingLoginSignUpLogin() async {
    try {
      CustomLoaderDialog.showLoader();
      if (login) {
        await AuthServices.signInUser(
          emailEditingController.text,
          passwordEditingController.text,
        );
      } else {
        final currentUser = await AuthServices.signupUser(
          emailEditingController.text,
          passwordEditingController.text,
        );
        if (currentUser != null) {
          try {
            bool result = await Get.toNamed(RoutesNames.verifyEmailScreen);
            if (result == true) {

              await _authController.registerTeacher(
                emailEditingController.text,
                currentUser.uid,
              );
            } else {
              Utils.errorSnackBar(
                "Verification Failed",
                'Please verify your email',
              );
            }
          } catch (e) {
            Utils.errorSnackBar('Error', 'Please try again later.');
          }
        } else {
          Utils.errorSnackBar('Error', 'Please try again later');
        }
      }
    } catch (e) {
      Utils.errorSnackBar('Error', e.toString());
    } finally {
      await CustomLoaderDialog.hideLoader();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                login ? 'Login Now' : 'Register Now',
                style: const TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryText,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Please enter the details below to continue.',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  EmailTextField(
                    text: 'Email',
                    nextNode: passwordFocusNode,
                    currentNode: emailFocusNode,
                    editingController: emailEditingController,
                  ),
                  const SizedBox(height: 20),
                  PasswordTextField(
                    text: "Password",
                    currentNode: passwordFocusNode,
                    editingController: passwordEditingController,
                    isVisible: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            RoundButton(
              text: login ? 'Login' : 'Register',
              onPress: () async {
                if (_formKey.currentState!.validate()) {
                  await handlingLoginSignUpLogin();
                } else {
                  Utils.errorSnackBar('Error', 'Please enter your credentials');
                }
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  login = !login;
                });
              },
              child: Text(
                login
                    ? "Don't have an account? Signup"
                    : "Already have an account? Login",
                style: const TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
