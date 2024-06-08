import 'package:get/get.dart';
import '../../Model/Student/student.dart';
import '../../Repository/Services/AuthService/auth_Service.dart';
import '../../global.dart';

class StudentEditController extends GetxController {
  final user = AuthServices().getCurrentUser();
  Rx<Student> student = Student(studentName: "", studentGender: "", studentDOB: "").obs;

  void getStudentValues(int index) async {
    String uid = user.uid;
    var snap = await fireStore
        .collection('Teachers')
        .doc(uid)
        .collection("Students")
        .doc(index.toString())
        .get();
    if(snap.exists){
      student.value = Student.fromSnap(snap);
    } else{
      throw Exception("Student not found");
    }
  }

  Future<bool> changeStudentValues(String studentName, String studentGender, String studentDOB, int index) async {
    print("changeStudentcalled");
    String uid = user.uid;
    Student updateStudent = Student(studentName: studentName, studentGender: studentGender, studentDOB: studentDOB);
    print(updateStudent);
    try{
      await fireStore.collection('Teachers').doc(uid).collection("Students").doc(index.toString()).update(updateStudent.toJson());
      return true;
    }catch(e){
      return false;
    }
  }

}
