part of 'authentication_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

@immutable
class AuthenticationState extends Emittable {
  final AppStatus status;
  final User user;

  AuthenticationState._({
    required this.status,
    this.user = User.empty,
  });

  AuthenticationState.authenticated(User user)
      : this._(
          status: AppStatus.authenticated,
          user: user,
        );
  AuthenticationState.unauthenticated()
      : this._(status: AppStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];

  @override
  void emit(Object? state) {
    // TODO: implement emit
  }
}

class AuthenticationInitialState extends AuthenticationState {
  AuthenticationInitialState.authenticated(super.user) : super.authenticated();
}

class AuthenticationLoginSuccessState extends AuthenticationState {}

class AuthenticationLoginFaileState extends AuthenticationState {}
