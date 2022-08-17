import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:electrops/src/UI/widgets/text_fild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          IconButton(
            onPressed: () {
              //settings here
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Image.network(profilePhoto)),
                  TextButton(
                    child: Text(
                      'Name: ' + name,
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      user?.updateDisplayName('jhon');
                    },
                  ),
                  TextButton(
                    child: Text('email:' + email),
                    onPressed: () {
                      user?.updateEmail('');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
