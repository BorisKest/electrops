import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

List imagesFromFS = [];

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

  //upload file

}

class UploadFile {
  late File imageFile;

  final picker = ImagePicker();

  Future uploadImaeToFirebase() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      File fileName = File(basename(imageFile.path));
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('images/$fileName');

      try {
        await firebaseStorageRef.putFile(imageFile);
      } on FirebaseException catch (e) {
        print(e);
      }
    }
  }
}

class FierStore {
  CollectionReference db1 = FirebaseFirestore.instance.collection('users');

  List getFirebaseImageFolder() {
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('images/');
    firebaseStorageRef.listAll().then((result) {
      imagesFromFS = result as List;
    });
    return imagesFromFS;
  }
}

Future<String?> getUser(String email) async {
  try {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final snapshot = await users.doc(email).get();
    final data = snapshot.data() as Map<String, dynamic>;
    return data['full_name'];
  } catch (e) {
    return 'Error fetching user';
  }
}
