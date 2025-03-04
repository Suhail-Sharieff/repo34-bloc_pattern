import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_events.dart';
part 'auth_state.dart';
//https://www.youtube.com/watch?v=SDk_GldOtK8&t=114s&ab_channel=RivaanRanawat

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Auth_Initial_State()) {
    on<AuthEvent>((ev, emit) => _handle_events(ev, emit));
  }

  void _handle_events(AuthEvent ev, Emitter<AuthState> emit) {
    switch (ev) {
      case Auth_Login_Requested():
        {
          if (ev.password_requested.length < 6) {
            emit(Auth_Login_Failure_State(
                failure_reason: "Password length < 6"));
            return;
          }
          emit(Auth_Login_Sucess_State(
              logged_email: "someone@gmail.com",
              logged_password: ev.password_requested));
          return;
        }
      case Auth_Logout_Requested():
        {
          emit(Auth_Initial_State());
          return;
        }
    }
  }
}
