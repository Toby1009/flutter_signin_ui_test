part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInEmailChange extends SignInEvent{
  final String email;

  SignInEmailChange(this.email);
}

class SignInPasswordChange extends SignInEvent{
  final String password;
  SignInPasswordChange(this.password);
}

class SignInSubmitted extends SignInEvent{}
