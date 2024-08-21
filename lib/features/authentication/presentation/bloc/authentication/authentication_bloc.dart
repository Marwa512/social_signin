import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState.initial()) {
    on<AuthenticationEvent>(
      (event, emit) {
        event.when(
          loginEvent: (type) async {
            emit(const _LoadInProgress());
            if (type == "facebook") {
              final LoginResult result = await FacebookAuth.instance.login(
                permissions: [
                  'public_profile',
                  'email',
                ],
              );
              if (result.status == LoginStatus.success) {
                emit(const LoginSuccess());
              } else {
                print(result.status);
                print(result.message);
              }
            } else if (type == "google") {
              final GoogleSignIn googleSignIn = GoogleSignIn(
                scopes: <String>[
                  'email',
                ],
              );

              // Get the user after successful sign in
              var googleUser = await googleSignIn.signIn();
            } else {}
          },
        );
      },
    );
  }
}
