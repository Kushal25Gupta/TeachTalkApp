import 'package:teachtool/Repository/Services/AuthService/auth_Service.dart';
import 'package:teachtool/ViewModel/TeacherProfileController/teacher_Profile_Controller.dart';
import 'package:teachtool/global.dart';
import 'package:get/get.dart';

class TeacherProfileService {
  TeacherProfileController teacherProfileController =
      Get.put(TeacherProfileController());

  final user = AuthServices().getCurrentUser();

  Future<void> setTeacherValues() async {
    String uid = user.uid;
    var snap = await fireStore.collection('Teachers').doc(uid).get();
    teacherProfileController.setTeacherEmail(snap['teacherEmail']);
    teacherProfileController
        .setTeacherProfilePhoto(snap['teacherProfilePhoto']);
  }
}
