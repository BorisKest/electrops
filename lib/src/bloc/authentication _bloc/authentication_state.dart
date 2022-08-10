part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {}

class AuthLoadingState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthUnAuthenticatedState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationErrorState extends AuthenticationState {
  final String error;

  AuthenticationErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
