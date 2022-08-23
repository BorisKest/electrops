import 'dart:io';
import 'package:electrops/src/models/firebase_file.dart';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
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
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  Future<List<FirebaseFile>> listAll(String path) async {
    final storageRef = FirebaseStorage.instance.ref(path);
    final listResult = await storageRef.listAll();

    final urls = await _getDownloadLinks(listResult.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = listResult.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }
}
