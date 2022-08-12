import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Favorit_screen extends StatefulWidget {
  const Favorit_screen({Key? key}) : super(key: key);

  @override
  State<Favorit_screen> createState() => _Favorit_screenState();
}

class _Favorit_screenState extends State<Favorit_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [],
      ),
      drawer: const DrawerWidget(),
    );
  }
}
