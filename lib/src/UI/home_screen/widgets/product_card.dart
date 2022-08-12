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
    return Container(
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Image.asset(
                image,
                fit: BoxFit.fitHeight,
              )),

          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 10,
              ),
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
            child: Text(
              price,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          // change with db asap
        ],
      ),
    );
  }
}
