import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Authrnticator {
  Authrnticator({Key? key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
}
