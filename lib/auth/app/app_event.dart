part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

class AppLogoutRequested extends AppEvent{
  const AppLogoutRequested();
}

class AppUserChanged extends AppEvent{
  const AppUserChanged(this.userId);
  final String userId;
}
