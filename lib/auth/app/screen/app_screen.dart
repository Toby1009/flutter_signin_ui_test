import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_ui_test/auth/app/bloc/app_bloc.dart';
import 'package:flutter_signin_ui_test/auth/auth_repositories/repository.dart';
import 'package:flutter_signin_ui_test/screen/home_screen.dart';
import 'package:flutter_signin_ui_test/screen/signin_screen.dart';

import '../../../routes/routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  final AuthRepository _authRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(authRepository: _authRepository),
        child: const AppScreen(),
      ),
    );
  }
}

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {

        return state.status == AppStatus.authenticated
            ? const MaterialApp(
                onGenerateRoute: MyRouter.generateRoute,
                home: HomeScreen(),
              )
            : const MaterialApp(
                onGenerateRoute: MyRouter.generateRoute,
                home: SignInScreen(),
              );
      },
    );
  }
}
