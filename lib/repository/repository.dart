import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_sample/model/user.dart';
import 'package:firebase_core/firebase_core.dart';

// Firebaseに値を保存する
Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;
  final json = user.toJson();
  await docUser.set(json);
}

// Firebaseから値を取得する
Stream<List<User>> readUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
