part of 'sign_in_bloc.dart';

class SignInState {
  late final String email;

  bool get isValidEmail => email.length > 3;
  final String password;

  bool get isValidPassword => password.length > 3;
  final FormSubmissionStatus? formStatus;

  SignInState({
    this.email = '',
    this.password = '',
    this.formStatus = const InititalFormStatus(),
  });

  SignInState copyWith(
      {String? email, String? password, FormSubmissionStatus? formStatus}) {
    email ??= this.email;
    password ??= this.password;
    formStatus ??= this.formStatus;
    return SignInState(
      email: email,
      password: password,
      formStatus:  formStatus,
    );
  }
  setEmail(String email){
    this.email = email;
  }

}
