// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../repository.dart';
// import '../form_submission_status.dart';
//
// part 'sign_in_event.dart';
// part 'sign_in_state.dart';
//
// class SignInBloc extends Bloc<SignInEvent, SignInState> {
//   SignInBloc({
//     required AuthRepository authRepository,
//   }) : _authRepository = authRepository,super(SignInState()){
//     on<SignInEmailChange>(_onEmailChange);
//     on<SignInPasswordChange>(_onPasswordChange);
//     on<SignInSubmitted>(_onSubmitted);
//   }
//   String email = '';
//   String password ='';
//
//   FormSubmissionStatus formStatus = const InititalFormStatus();
//
//   final AuthRepository _authRepository;
//
//   void _onEmailChange(
//       SignInEmailChange event,
//       Emitter<SignInState> emit,
//       ){
//       email = event.email;
//       emit(getBlocState());
//   }
//   void _onPasswordChange(
//       SignInPasswordChange event,
//       Emitter<SignInState> emit,
//       ){
//    password = event.password;
//    emit(getBlocState());
//   }
//
//   Future<void> _onSubmitted(
//       SignInSubmitted event,
//       Emitter<SignInState> emit,
//       ) async {
//     formStatus = FormSubmitting();
//     // try {
//     //   await _authRepository.signIn(email,password);
//     //   formStatus = SubmittionSuccess();
//     // } on Exception catch (e) {
//     //   formStatus = SubmittionFailed(e);
//     // }
//     int checkAccount = await _authRepository.signIn(email,password);
//     if(checkAccount==1){
//       formStatus = SubmittionSuccess();
//     }else if (checkAccount==0){
//       formStatus = SubmittionFailed();
//     }
//     emit(getBlocState());
//   }
//
//   SignInState getBlocState(){
//     return state.copyWith(
//         email: email,
//         password: password,
//         formStatus: formStatus);
//   }
// }
