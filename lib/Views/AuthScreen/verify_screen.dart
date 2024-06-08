import 'dart:async';
import 'package:teachtool/Resources/Colors/App_Colors.dart';
import 'package:teachtool/Resources/Components/TextStyle/App_Text_Style.dart';
import 'package:teachtool/Utils/Utils.dart';
import 'package:teachtool/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
  });
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = fireAuth.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();
    }
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => checkEmailVerified(),
    );
  }

  Future sendVerificationEmail() async {
    try {
      final user = fireAuth.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.errorSnackBar('Error', e.toString());
    }
  }

  Future checkEmailVerified() async {
    await fireAuth.currentUser!.reload();

    setState(() {
      isEmailVerified = fireAuth.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      _timer?.cancel();
      Get.back(result: true);
      Utils.successSnackBar(
        "Verification Successful",
        "Congress your email is successfully verified",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: AppColor.purpleBackgroundColor,
        title: Text(
          isEmailVerified? "Verifying Email": "Verify Email",
          style: AppTextStyle.boldPurpleStyle.copyWith(fontSize: 25),
        ),
      ),
      body: isEmailVerified?  const Center(child: CircularProgressIndicator()): Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'A verification email has been sent to your email, Please Verify.',
              textAlign: TextAlign.center,
              style: AppTextStyle.boldBlackStyle.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: AppColor.presentCardColor,
              ),
              icon: const Icon(
                Icons.email,
                size: 32,
                color: AppColor.secondaryText,
              ),
              label: Text(
                "Resend Email",
                style: AppTextStyle.boldBlackStyle.copyWith(
                  color: AppColor.secondaryText,
                ),
              ),
              onPressed: canResendEmail ? sendVerificationEmail : null,
            ),
            const SizedBox(height: 25),
            TextButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: AppColor.absentCardColor,
              ),
              child: const Text("Cancel"),
              onPressed: () => fireAuth.signOut,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }
}
