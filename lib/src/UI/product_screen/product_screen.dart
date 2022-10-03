import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  String image;
  String name;
  String price;
  ProductScreen(
      {Key? key, required this.image, required this.name, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(name),
                  const Spacer(),
                  Text(price),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
