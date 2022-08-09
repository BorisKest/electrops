import 'package:electrops/src/UI/widgets/text_fild.dart';
import 'package:electrops/src/bloc/authentication%20_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

class AuthSignInScreen extends StatefulWidget {
  const AuthSignInScreen({Key? key}) : super(key: key);

  @override
  State<AuthSignInScreen> createState() => _AuthSignInScreenState();
}

class _AuthSignInScreenState extends State<AuthSignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _authenticationWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthenticationBloc>(context).add(
        AuthSignInRequestedEvent(
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
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
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
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AuthUnAuthenticatedState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sign In', style: TextStyle(fontSize: 50)),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value != null &&
                                            !EmailValidator.validate(value)
                                        ? 'Enter a valid email'
                                        : null;
                                  },
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value != null && value.length < 6
                                        ? "Enter min. 6 characters"
                                        : null;
                                  },
                                ),
                              ],
                            ),
                          ),
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
                              'Sign In',
                            ),
                          ),
                        ),
                        const Text("Don't have an account?"),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/signup');
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
