import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  Future<void> googleSignIn() async {
    // Initialize GoogleSignIn with the scopes you want:
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    );

    // Get the user after successful sign in
    var googleUser = await googleSignIn.signIn();
  }

  Future<void> facebookLogin() async {
    // await FacebookAuth.instance.logOut();
    print("logout");
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: [
        'public_profile',
        'email',
      ],
    );
    if (result.status == LoginStatus.success) {
    } else {
      print(result.status);
      print(result.message);
    }
  }

  // keytool -exportcert -alias androiddebugkey -keystore "E:\projects\social_login\android\app" | "C:\Users\CompuMisr\Downloads\Compressed\openssl-0.9.8k_X64\bin\openssl.exe" sha1 -binary | "C:\Users\CompuMisr\Downloads\Compressed\openssl-0.9.8k_X64\bin\openssl.exe" base64
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Social Login",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 1,
                    width: 60,
                    color: Colors.grey,
                  ),
                  const Text("OR"),
                  Container(
                    height: 1,
                    width: 60,
                    color: Colors.grey,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        facebookLogin();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      )),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: SignInWithAppleButton(
                      text: "",
                      style: SignInWithAppleButtonStyle.white,
                      onPressed: () async {
                        // final credential =
                        //     await SignInWithApple.getAppleIDCredential(
                        //   scopes: [
                        //     AppleIDAuthorizationScopes.email,
                        //     AppleIDAuthorizationScopes.fullName,
                        //   ],
                        // );

                        // print(credential);
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        googleSignIn();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
