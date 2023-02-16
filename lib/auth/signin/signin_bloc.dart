import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_ui_test/auth/form_submission_status.dart';

import 'package:flutter_signin_ui_test/auth/signin/signin_event.dart';
import 'package:flutter_signin_ui_test/auth/signin/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event)async*{
    if(event is SignInEmailChange){
        yield state.copyWith(email: event.email);
    } else if(event is SignInPasswordChange){
        yield state.copyWith(password: event.password);
    } else if(event is SignInSubmitted){
        yield state.copyWith(formStatus: FormSubmitting());
    }
  }
}
