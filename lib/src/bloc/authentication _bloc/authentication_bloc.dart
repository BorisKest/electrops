import 'package:bloc/bloc.dart';
import 'package:electrops/src/models/user_model.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>(
      (event, emit) {
        // TODO: implement event handler
      },
    );
    on<AuthenticationLoginSuccessEvent>(
      (event, emit) {},
    );
    on<AuthenticationLoginFailEvent>(
      (event, emit) {},
    );
    on<AuthenticationLogginOffEvent>(
      (event, emit) {},
    );
  }
}
