import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:electrops/src/UI/upload/widgets/textfild_card.dart';
import 'package:electrops/src/bloc/data_bloc/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

enum StringCharacters { animals, tech, nature, people, food, architecture }

class _UploadScreenState extends State<UploadScreen> {
  late TextEditingController titleTextFildController;
  late TextEditingController descriptionTextFildController;
  late TextEditingController priceTextFildController;

  bool isExpanded = false;
  StringCharacters? characters = StringCharacters.animals;

  @override
  void initState() {
    super.initState();
    titleTextFildController = TextEditingController();
    descriptionTextFildController = TextEditingController();
    priceTextFildController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    DataBloc databloc = BlocProvider.of<DataBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload your photos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: const Card(
                      elevation: 4,
                      child: Center(child: Icon(Icons.image)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          databloc.add(UploadDataEvent());
                        },
                        child: const Icon(Icons.upload_rounded),
                      ),
                    ),
                  ),
                ],
              ),
              TextFildCard(
                text: 'Title',
                textFildController: titleTextFildController,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: ListTile(
                        title: const Text('Animals'),
                        leading: Radio<StringCharacters>(
                          value: StringCharacters.animals,
                          groupValue: characters,
                          onChanged: (value) {
                            setState(() {
                              characters = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: ListTile(
                        title: const Text('Tech'),
                        leading: Radio<StringCharacters>(
                          value: StringCharacters.tech,
                          groupValue: characters,
                          onChanged: (value) {
                            setState(() {
                              characters = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: ListTile(
                        title: const Text('Nature'),
                        leading: Radio<StringCharacters>(
                          value: StringCharacters.nature,
                          groupValue: characters,
                          onChanged: (value) {
                            setState(() {
                              characters = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: ListTile(
                        title: const Text('People'),
                        leading: Radio<StringCharacters>(
                          value: StringCharacters.people,
                          groupValue: characters,
                          onChanged: (value) {
                            setState(() {
                              characters = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: ListTile(
                        title: const Text('Food'),
                        leading: Radio<StringCharacters>(
                          value: StringCharacters.food,
                          groupValue: characters,
                          onChanged: (value) {
                            setState(() {
                              characters = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: ListTile(
                        title: const Text('Architecture'),
                        leading: Radio<StringCharacters>(
                          value: StringCharacters.architecture,
                          groupValue: characters,
                          onChanged: (value) {
                            setState(() {
                              characters = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextFildCard(
                text: 'Description',
                textFildController: descriptionTextFildController,
              ),
              TextFildCard(
                text: 'Price',
                textFildController: priceTextFildController,
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
