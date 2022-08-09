import 'package:electrops/src/UI/widgets/text_fild.dart';
import 'package:electrops/src/bloc/authentication%20_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

class AuthSignUpScreen extends StatefulWidget {
  const AuthSignUpScreen({Key? key}) : super(key: key);

  @override
  State<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _authenticationWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthenticationBloc>(context).add(
        AuthSignUpRequestedEvent(
            _emailController.text, _passwordController.text),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
          if (state is AuthenticationErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('state.error'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AuthUnAuthenticatedState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sing Up', style: TextStyle(fontSize: 50)),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextFild(
                      controller: _emailController,
                      textLabel: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextFild(
                      obscureText: true,
                      controller: _passwordController,
                      textLabel: 'Password',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          _authenticationWithEmailAndPassword(context);
                        },
                        child: const Text(
                          'Sign Up',
                        ),
                      ),
                    ),
                    const Text("Have an account?"),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
