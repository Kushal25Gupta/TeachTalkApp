import 'package:teachtool/Model/Teacher/teacher.dart';
import 'package:teachtool/Repository/Services/firestore_service.dart';
import 'package:teachtool/Utils/Utils.dart';
import 'package:get/get.dart';
import '../../Resources/Routes/Routes_Names.dart';
import 'package:teachtool/global.dart';
import 'package:teachtool/Repository/Services/register_service.dart';

class AuthController extends GetxController {
  final RegisterService _registerService = RegisterService();
  Future<void> registerTeacher(String email, String uid) async {
    try {
      var snap = await fireStore.collection('Teachers').doc(uid).get();
      if (!snap.exists) {
        String profilePhoto =
        await _registerService.uploadDefaultProfilePhoto(email);
        var currentTeacher = Teacher(
          teacherEmail: email,
          teacherProfilePhoto: profilePhoto,
        );
        FireStoreServices.saveUser(currentTeacher, uid);
      }
      Get.offAllNamed(RoutesNames.navigationBar);
      Utils.successSnackBar('Success', "Registration Successful");
    } catch (e) {
      Utils.errorSnackBar('Error', e.toString());
      Get.back();
    }
  }
}
