part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationLoginInitEvent extends AuthenticationEvent {
  final String login;
  final String pass;
  AuthenticationLoginInitEvent(this.login, this.pass);

  @override
  List<Object> get propsLogin => [login];
  List<Object> get propsPass => [pass];
}

class AuthenticationLoginSuccessEvent extends AuthenticationEvent {}

class AuthenticationLoginFailEvent extends AuthenticationEvent {}

class AuthenticationLogginOffEvent extends AuthenticationEvent {}
