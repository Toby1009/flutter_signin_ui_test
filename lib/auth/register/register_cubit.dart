import 'package:bloc/bloc.dart';
import 'package:flutter_signin_ui_test/auth/auth_repositories/user.dart';

import 'package:flutter_signin_ui_test/auth/form_submission_status.dart';
import 'package:flutter_signin_ui_test/auth/models/user_model.dart';

import '../auth_repositories/repository.dart';
import 'package:flutter_signin_ui_test/auth/auth_repositories/user.dart';

part 'register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepository) : super(RegisterState());
  final AuthRepository _authRepository;
  String name = '' ;
  String email = '';
  String password ='';

  FormSubmissionStatus formStatus = const InititalFormStatus();

  void onNameChange(String value){
      name = value;
      emit(getCubitState());
  }
  void onEmailChange(String value){
    email = value;
    emit(getCubitState());
  }
  void onPasswordChange(String value){
    password = value;
    emit(getCubitState());
  }
  Future<void> registerFormSubmitted(UserModel userModel)async{
    formStatus = FormSubmitting();
    int registerAccount = await _authRepository.register(userModel);
    if(registerAccount>=1){
      formStatus = SubmittionSuccess();
      print("ss");
    }else{
      print("ff");
      formStatus = SubmittionFailed();
    }
    emit(getCubitState());
  }


  RegisterState getCubitState(){
    return state.copyWith(
        name: name,
        email: email,
        password: password,
        formStatus: formStatus);
  }
}
