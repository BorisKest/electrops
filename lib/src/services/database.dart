import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}

class AddUser {
  final String name;
  final String image;
  AddUser(this.name, this.image);

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users
        .add({'name': name, 'image': image})
        .then((value) => print("User Added"))
        .catchError((error) => print('Fail to add user: $error'));
  }
}
