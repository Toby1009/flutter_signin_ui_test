import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_signin_ui_test/auth/auth_repositories/repository.dart';
import 'package:meta/meta.dart';

import '../../auth_repositories/user.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthRepository authRepository})
      :_authRepository = authRepository,
      super(
        authRepository.currentUser.isNotEmpty
            ?AppState.authenticated(authRepository.currentUser)
            :const AppState.unauthenticated(),
      ){
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);

     _userSubscription = _authRepository.userStream.listen(
            (user) =>add(_AppUserChanged(user)));

  }
  final AuthRepository _authRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(_AppUserChanged event,Emitter<AppState> emit){
    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(event.user)
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event,Emitter<AppState> emit){
    unawaited(_authRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

}


