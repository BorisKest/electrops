import 'package:electrops/src/services/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ElectroPsApp());
}

class ElectroPsApp extends StatefulWidget {
  const ElectroPsApp({Key? key}) : super(key: key);

  @override
  State<ElectroPsApp> createState() => _ElectroPsAppState();
}

class _ElectroPsAppState extends State<ElectroPsApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
