part of 'auth_bloc.dart';

sealed class AuthEvent {}

class Auth_Login_Requested extends AuthEvent {
  //since im validatng for password only for now
  final String password_requested;
  Auth_Login_Requested({required this.password_requested});
}

class Auth_Logout_Requested extends AuthEvent{}


