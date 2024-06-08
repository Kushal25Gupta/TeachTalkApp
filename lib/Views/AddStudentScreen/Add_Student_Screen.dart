import 'package:teachtool/Repository/Services/teacher_profile_service.dart';
import 'package:teachtool/Resources/Components/AppBar/custom_app_bar.dart';
import 'package:teachtool/Resources/Components/Buttons/Round_Button.dart';
import 'package:teachtool/ViewModel/TeacherProfileController/teacher_Profile_Controller.dart';
import 'package:teachtool/Views/AddStudentScreen/Add_New_Student_Form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TeacherProfileController teacherProfileController =
      Get.put(TeacherProfileController());

  @override
  void initState() {
    super.initState();
    gettingTeacherValues();
  }

  void gettingTeacherValues() async {
    await TeacherProfileService().setTeacherValues();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar()
            .customAppBar(teacherProfileController.teacherProfilePhoto.value),
        body: Center(
          child: SizedBox(
            width: 200,
            child: RoundButton(
              onPress: () {
                Get.to(const AddNewStudentForm());
              },
              text: "Add New Student",
            ),
          ),
        ),
      );
    });
  }
}
