import 'package:flutter/material.dart';

class TextFildCard extends StatelessWidget {
  final String text;
  final TextEditingController textFildController;
  const TextFildCard(
      {Key? key, required this.text, required this.textFildController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$text: '),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: TextField(
              controller: textFildController,
            ),
          ),
        ],
      ),
    );
  }
}
