import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerWidget extends StatelessWidget {
  final String profileImage = 'assets/images/avatar.jpg';
  final String name = 'John Doe';
  final String status = 'online';
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset(profileImage),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(name),
                        Text(status),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Row(
                children: const [Icon(Icons.home_max_outlined), Text('Home')]),
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
            title: Row(children: const [
              Icon(Icons.home_max_outlined),
              Text('Search')
            ]),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/search');
            },
          ),
          ListTile(
            title: Row(children: const [
              Icon(Icons.home_max_outlined),
              Text('Account')
            ]),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/account');
            },
          ),
          ListTile(
            title: Row(children: const [
              Icon(Icons.home_max_outlined),
              Text('Settings')
            ]),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('/home'); // add settings screen
            },
          ),
        ],
      ),
    );
  }
}
