import '../../Model/Teacher/teacher.dart';
import '../../global.dart';

class FireStoreServices {
  static saveUser(Teacher currentTeacher, String uid) async {
    await fireStore
        .collection('Teachers')
        .doc(uid)
        .set(currentTeacher.toJson());
  }
}
