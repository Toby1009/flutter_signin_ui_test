import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import '../form_submission_status.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository? authRepository;
  String email = '';
  String password ='';
  FormSubmissionStatus formStatus = const InititalFormStatus();
  SignInBloc({this.authRepository}) : super(SignInState()){
    on<SignInEvent>(mapEventToState);
  }
  void mapEventToState(SignInEvent event,Emitter<SignInState> emit)async{
    if(event is SignInEmailChange){
      email = event.email;
    }else if(event is SignInPasswordChange){
      password = event.password;
    }else if(event is SignInSubmitted){
      formStatus = FormSubmitting();
      try{
        await authRepository?.signIn();
        formStatus = SubmittionSuccess();
      }on Exception catch(e){
        formStatus = SubmittionFailed(e);
      }
    }
    emit(getBlocState());
  }

  SignInState getBlocState(){
    return SignInState(
        email: email,
        password: password,
        formStatus: formStatus);
  }
}
