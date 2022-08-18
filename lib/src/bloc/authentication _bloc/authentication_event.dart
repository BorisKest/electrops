part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserIsLogginEvent extends AuthenticationEvent {}

class AuthSignInRequestedEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthSignInRequestedEvent(this.email, this.password);
}

class AuthSignUpRequestedEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthSignUpRequestedEvent(this.email, this.password);
}

class AuthSignOutRequestedEvent extends AuthenticationEvent {}
