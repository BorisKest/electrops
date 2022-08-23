import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BucketScreen extends StatelessWidget {
  const BucketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      drawer: DrawerWidget(),
    );
  }
}
