part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoginSuccessState extends AuthenticationState {}

class AuthenticationLoginFaileState extends AuthenticationState {}
