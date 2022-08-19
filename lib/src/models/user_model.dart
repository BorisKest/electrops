import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User extends Equatable {
  String id;
  String? email;
  String? name;
  String? password;

  User({required this.id, this.email, this.name, this.password});

  static User empty = User(id: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, email, name];
}

class GetUserData {
  var user = FirebaseAuth.instance.currentUser;
  String name = '';
  String email = '';
  String profilePhoto = '';
  void userData() {
    if (user != null) {
      name = user!.displayName!;
      profilePhoto = user!.photoURL ??
          'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png';
      email = user!.email!;
    }
  }
}
