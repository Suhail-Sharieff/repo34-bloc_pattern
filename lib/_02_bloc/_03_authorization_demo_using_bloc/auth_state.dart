part of 'auth_bloc.dart';


sealed class AuthState{}


//initital state when user opens application ie neither loginSuccess or failure
final class Auth_Initial_State extends AuthState{}

class Auth_Login_Sucess_State extends AuthState {
  final String logged_email;
  final String logged_password;
  Auth_Login_Sucess_State({required this.logged_email, required this.logged_password});
}

class Auth_Login_Failure_State extends AuthState {
  final String failure_reason;
  Auth_Login_Failure_State({required this.failure_reason});
}
