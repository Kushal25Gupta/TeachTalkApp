import '../../Utils/Utils.dart';
import 'package:teachtool/global.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class RegisterService {
  Future<String> uploadDefaultProfilePhoto(String userEmail) async {
    try {
      String path = 'assets/images/VectorPerson.png';
      final ByteData data = await rootBundle.load(path);
      final List<int> bytes = data.buffer.asUint8List();
      final Uint8List uint8list = Uint8List.fromList(bytes);
      Reference ref =
          firebaseStorage.ref().child('ProfilePhoto').child(userEmail);
      UploadTask uploadTask = ref.putData(uint8list);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      Utils.errorSnackBar('Error', e.toString());
      return "";
    }
  }
}
