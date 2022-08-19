import 'package:electrops/src/models/user_model.dart';
import 'package:electrops/src/services/authentication.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final String profileImage = 'assets/images/avatar.png';
  final String name = GetUserData().name;
  final String status = 'online';
  DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Material(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(profileImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        const Divider(),
                        Text(status),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title:
                Row(children: const [Icon(Icons.home_outlined), Text('Home')]),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            title: Row(children: const [
              Icon(Icons.favorite_outline),
              Text('Favorite')
            ]),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/favorit');
            },
          ),
          ListTile(
            title: Row(
                children: const [Icon(Icons.search_outlined), Text('Search')]),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/search');
            },
          ),
          ListTile(
            title: Row(children: const [Icon(Icons.upload), Text('Upload')]),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('/upload'); // add settings screen
            },
          ),
          ListTile(
            title: Row(children: const [
              Icon(Icons.account_box_outlined),
              Text('Account')
            ]),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/account');
            },
          ),
          ListTile(
            title: Row(children: const [
              Icon(Icons.settings_outlined),
              Text('Settings')
            ]),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('/home'); // add settings screen
            },
          ),
          ListTile(
            title: Row(
                children: const [Icon(Icons.exit_to_app), Text('Sign out')]),
            onTap: () {
              Authrnticator().signOut();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
