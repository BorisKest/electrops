import 'package:electrops/src/UI/product_screen/product_screen.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(
              image: image,
              name: text,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Stack(
                children: <Widget>[
                  Material(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.bottomRight,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                    ),
                  ),
                ],
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
