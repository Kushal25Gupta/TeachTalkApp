import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher {
  String teacherEmail;
  String teacherProfilePhoto;

  Teacher({
    required this.teacherEmail,
    required this.teacherProfilePhoto,
  });

  Map<String, dynamic> toJson() => {
        'teacherEmail': teacherEmail,
        'teacherProfilePhoto': teacherProfilePhoto,
      };

  factory Teacher.fromSnap(DocumentSnapshot snapshot) {
    final doc = snapshot.data() as Map<String, dynamic>;
    return Teacher(
      teacherEmail: doc['teacherEmail'] ?? ' ',
      teacherProfilePhoto: doc['teacherProfilePhoto'] ?? ' ',
    );
  }
}
