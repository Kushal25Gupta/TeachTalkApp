import 'package:get/get.dart';

class TeacherProfileController extends GetxController{

  Rx<String> teacherName = "".obs;
  Rx<String> teacherEmail = "".obs;
  Rx<String> teacherProfilePhoto = "".obs;

  void setTeacherName(String name) {
    teacherName.value = name;
  }

  void setTeacherEmail(String email){
    teacherEmail.value = email;
  }

  void setTeacherProfilePhoto(String photoUrl){
    teacherProfilePhoto.value = photoUrl;
  }

}