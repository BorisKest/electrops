import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({Key? key}) : super(key: key);

  @override
  State<FavoritScreen> createState() => FavoritScreenState();
}

class FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CustomScrollView(
        slivers: [],
      ),
      drawer: DrawerWidget(),
    );
  }
}
