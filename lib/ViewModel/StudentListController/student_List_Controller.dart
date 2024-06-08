import 'package:teachtool/Model/Student/student.dart';
import 'package:teachtool/ViewModel/TeacherProfileController/teacher_Profile_Controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:teachtool/global.dart';

class StudentListController extends GetxController {
  final Rx<List<Student>> _studentList = Rx<List<Student>>([]);
  List<Student> get studentList => _studentList.value;
  TeacherProfileController teacherProfileController = Get.find<TeacherProfileController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(teacherProfileController.teacherEmail, (String newEmail) {
      _bindStudentsStream(newEmail);
    });
    _bindStudentsStream(teacherProfileController.teacherEmail.value);
  }

  void _bindStudentsStream(String teacherEmail) {
    String uid = fireAuth.currentUser!.uid;
    if (teacherEmail.isNotEmpty) {
      _studentList.bindStream(
        fireStore
            .collection("Teachers")
            .doc(uid)
            .collection('Students')
            .snapshots()
            .map((QuerySnapshot query) {
          List<Student> retVal = [];
          for (var element in query.docs) {
            retVal.add(Student.fromSnap(element));
          }
          return retVal;
        }),
      );
    } else {
      _studentList.value = [];
    }
  }
}
