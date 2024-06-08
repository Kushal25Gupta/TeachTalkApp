import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_storage/get_storage.dart';

final getStorage = GetStorage();
final fireAuth = FirebaseAuth.instance;
final fireStore = FirebaseFirestore.instance;
final firebaseStorage = FirebaseStorage.instance;