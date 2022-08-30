import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Text("He'd have you all unravel at the"),
          )
        ],
      ),
    );
  }
}
