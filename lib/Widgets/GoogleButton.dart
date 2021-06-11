
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';


class GoogleButton extends StatelessWidget {
  final double minwidth;
  final double height;
  final Color? textcolor;
  final Color? color;
  final String text;
  /// Verion 1.0 20210611
  /// A functional button to conncet google login while pressed on (Web/Android/iOS).
  ///
  /// Remember to enable google login function on firebase.
  ///
  /// Remember for iOS, goto iOS/Runner/Info.plist, fill in GoogleService-Info.plist key
  ///
  /// Example : 	<string>com.googleusercontent.apps.408336808724-1k8c2o30odi248fqn7uss5g4p5mh457i</string>
  const GoogleButton({Key? key, this.textcolor, this.color, this.minwidth=270, this.height =47, this.text ='Google Login'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfirmButton(onPressed: () async {
      try {
        if (kIsWeb) {
          await signInWithGoogleWeb();
        } else if (Platform.isAndroid || Platform.isIOS) {
          await signInWithGoogle();
        }
      } catch (e) {
        print(e);
      }
    },text: text,textcolor: textcolor== null ? Colors.black87 : textcolor!, color: color ==null ? Colors.yellow : color, height: height, minWidth: minwidth,
    );
  }
}

//?/ Web google login start

Future<UserCredential> signInWithGoogleWeb() async {
  print('Signing in with google web');

  // Create a new provider
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithPopup(googleProvider);

  // Or use signInWithRedirect
  // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
}

//?/google login code
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
