part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  const factory AuthenticationState.loadInProgress() = _LoadInProgress;
  const factory AuthenticationState.loginSuccess() = LoginSuccess;
}
