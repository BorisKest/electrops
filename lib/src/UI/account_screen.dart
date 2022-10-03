import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:electrops/src/models/user_model.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    GetUserData().userData();
  }

  var name = GetUserData().name;
  var email = GetUserData().email;
  var profilePhoto = GetUserData().profilePhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: [
          IconButton(
            onPressed: () {
              //settings here
            },
            icon: const Icon(Icons.settings),
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
                      'Name: $name',
                      style: const TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      GetUserData().user!.updateDisplayName('jhon');
                    },
                  ),
                  TextButton(
                    child: Text('email:$email'),
                    onPressed: () {
                      print(profilePhoto);
                      //user?.updateEmail('');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
