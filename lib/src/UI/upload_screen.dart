import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:electrops/src/bloc/data_bloc/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    DataBloc databloc = BlocProvider.of<DataBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Upload your photos'),
            FloatingActionButton(
              onPressed: () {
                databloc.add(UploadDataEvent());
              },
              child: const Icon(Icons.upload_rounded),
            )
          ],
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
