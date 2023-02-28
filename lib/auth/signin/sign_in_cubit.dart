import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_ui_test/auth/app/bloc/app_bloc.dart';
import 'package:flutter_signin_ui_test/auth/signin/sign_in_bloc.dart';

import '../auth_repositories/repository.dart';
import '../form_submission_status.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState>{
  SignInCubit(this._authRepository):super(SignInState());
  final AuthRepository _authRepository;
  String email = '';
  String password ='';
  FormSubmissionStatus formStatus = const InititalFormStatus();

  void onEmailChange(String value){
    email = value;
    emit(getBlocState());
  }
  void onPasswordChange(String value){
    password = value;
    emit(getBlocState());
  }

  Future<void> onSubmitted() async {
    formStatus = FormSubmitting();
    int checkAccount = await _authRepository.signIn(email,password);
    if(checkAccount==1){
      formStatus = SubmittionSuccess();
    }else if (checkAccount==0){
      formStatus = SubmittionFailed();
    }
    emit(getBlocState());
  }

  SignInState getBlocState(){
    return state.copyWith(
        email: email,
        password: password,
        formStatus: formStatus);
  }


}