import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String text;
  final String price;
  const ProductCard({
    Key? key,
    required this.image,
    required this.text,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Image.asset(image),
            Spacer(),
            Text(text),
            Spacer(),
            Text(price),
            // change with db asap
          ],
        ),
      ),
    );
  }
}
