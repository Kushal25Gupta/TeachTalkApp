import 'package:teachtool/Resources/Components/AppBar/custom_app_bar.dart';
import 'package:teachtool/Resources/Components/TextStyle/App_Text_Style.dart';
import 'package:teachtool/Resources/Components/Custom_Student_Card.dart';
import 'package:teachtool/Resources/Routes/Routes_Names.dart';
import 'package:teachtool/ViewModel/StudentListController/student_List_Controller.dart';
import 'package:teachtool/ViewModel/TeacherProfileController/teacher_Profile_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  TeacherProfileController teacherProfileController =
      Get.find<TeacherProfileController>();
  StudentListController studentListController =
      Get.put(StudentListController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        String profilePhoto =
            teacherProfileController.teacherProfilePhoto.value;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar().customAppBar(profilePhoto),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Student's",
                  style: AppTextStyle.boldPurpleStyle,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: studentListController.studentList.length,
                    itemBuilder: (context, index) {
                      final student = studentListController.studentList[index];
                      return CustomStudentCard(
                        studentName: student.studentName,
                        studentGender:  student.studentGender,
                        studentDOB:  student.studentDOB,
                        onPress: (){
                          Get.toNamed(RoutesNames.studentEditScreen, arguments: index+1);
                        }
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
