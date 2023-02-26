part of 'register_cubit.dart';

class RegisterState{
  final String name;
  final String email;

  bool get isValidEmail => email.length > 3;
  final String password;

  bool get isValidPassword => password.length > 3;
  final FormSubmissionStatus? formStatus;

  RegisterState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.formStatus = const InititalFormStatus(),
});
  RegisterState copyWith(
  { String? name, String? email, String? password, FormSubmissionStatus? formStatus}
      ){
    return RegisterState(
      name: name??this.name,
      email: email??this.name,
      password: password??this.name,
      formStatus: formStatus??this.formStatus,
    );
  }

}
