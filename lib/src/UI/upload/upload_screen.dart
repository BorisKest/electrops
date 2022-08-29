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

class _UploadScreenState extends State<UploadScreen> {
  late TextEditingController titleTextFildController;
  late TextEditingController descriptionTextFildController;
  late TextEditingController priceTextFildController;

  bool isExpanded = false;

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
      body: Padding(
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
            Row(
              children: [],
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
      drawer: DrawerWidget(),
    );
  }
}
