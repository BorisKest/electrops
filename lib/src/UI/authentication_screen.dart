import 'package:electrops/src/UI/widgets/text_fild.dart';
import 'package:electrops/src/bloc/authentication%20_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late TextEditingController controllerLogin;
  late TextEditingController controllerPass;

  @override
  void initState() {
    super.initState();
    controllerLogin = TextEditingController();
    controllerPass = TextEditingController();
  }

  @override
  void dispose() {
    controllerLogin.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('EPS', style: TextStyle(fontSize: 100)),
              const SizedBox(
                height: 25,
              ),
              CustomTextFild(
                controller: controllerLogin,
                textLabel: 'login',
                obscureText: false,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFild(
                obscureText: true,
                controller: controllerPass,
                textLabel: 'Password',
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 400,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    bloc.add(AuthenticationLoginInitEvent(
                        controllerLogin.text, controllerPass.text));
                  },
                  child: const Text(
                    'Login',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
