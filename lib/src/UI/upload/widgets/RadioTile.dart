import 'package:flutter/material.dart';

enum StringCharacters { animals, tech, nature, people, food, architecture }

StringCharacters? characters = StringCharacters.animals;

class CustomeRadioTile extends StatelessWidget {
  String text = '';
  StringCharacters value;
  CustomeRadioTile({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ListTile(
        title: Text(text),
        leading: Radio<StringCharacters>(
          value: value,
          groupValue: characters,
          onChanged: (value) {
            characters = value;
            print(value);
          },
        ),
      ),
    );
  }
}
