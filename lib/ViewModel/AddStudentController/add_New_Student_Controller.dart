import 'package:teachtool/Model/Student/student.dart';
import 'package:teachtool/Resources/Components/Custom_Dialog.dart';
import 'package:teachtool/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddNewStudentController extends GetxController {
  final fireStore = FirebaseFirestore.instance;

  Future<bool> addNewStudent(String studentName, String studentGender,
      String studentDOB) async {
    try {
      CustomLoaderDialog.showLoader();
      String teacherEmail = fireAuth.currentUser!.email ?? ' ';
      String uid = fireAuth.currentUser!.uid ?? ' ';
      QuerySnapshot querySnapshot =  await fireStore.collection('Teachers').doc(uid).collection('Students').get();
      int length = querySnapshot.docs.length;
      var newStudent = Student(
        studentName: studentName,
        studentGender: studentGender,
        studentDOB: studentDOB,
      );
      await fireStore.collection('Teachers').doc(uid).collection('Students').doc('${length+1}').set(newStudent.toJson());
      await CustomLoaderDialog.hideLoader();
      return true;
    } catch (e) {
      await CustomLoaderDialog.hideLoader();
      return false;
    }
  }
}
