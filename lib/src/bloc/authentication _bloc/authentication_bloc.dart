import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:electrops/src/models/user_model.dart';
import 'package:electrops/src/services/authentication.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Authrnticator authrnticator;
  AuthenticationBloc({required this.authrnticator})
      : super(AuthUnAuthenticatedState()) {
    on<UserIsLogginEvent>(
      (event, emit) {
        emit(AuthLoadingState());
        if (FirebaseAuth.instance.currentUser != null) {
          emit(AuthenticatedState());
        } else {
          emit(AuthUnAuthenticatedState());
        }
      },
    );
    on<AuthSignInRequestedEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          await authrnticator.signIn(
              email: event.email, password: event.password);
          emit(AuthenticatedState());
        } catch (e) {
          emit(AuthenticationErrorState(e.toString()));
          emit(AuthUnAuthenticatedState());
        }
      },
    );

    on<AuthSignUpRequestedEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          await authrnticator.signUp(
              email: event.email, password: event.password);
          emit(AuthenticatedState());
        } catch (e) {
          emit(AuthenticationErrorState(e.toString()));
          emit(AuthUnAuthenticatedState());
        }
      },
    );

    on<AuthSignOutRequestedEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        await authrnticator.signOut();
        emit(AuthUnAuthenticatedState());
      },
    );
  }
}
