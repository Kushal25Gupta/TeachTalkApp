import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String studentName;
  String studentGender;
  String studentDOB;

  Student({
    required this.studentName,
    required this.studentGender,
    required this.studentDOB,
  });

  Map<String, dynamic> toJson() => {
        'studentName': studentName,
        'studentGender': studentGender,
        'studentDOB': studentDOB,
      };

  factory Student.fromSnap(DocumentSnapshot snapshot) {
    final doc = snapshot.data() as Map<String, dynamic>;
    return Student(
      studentName: doc['studentName'] ?? ' ',
      studentGender: doc['studentGender'] ?? ' ',
      studentDOB: doc['studentDOB'] ?? ' ',
    );
  }
}
