part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationLoginSuccessEvent extends AuthenticationEvent {}

class AuthenticationLoginFailEvent extends AuthenticationEvent {}

class AuthenticationLogginOffEvent extends AuthenticationEvent {}
