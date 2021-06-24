import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> initializeFirebase(

    /// This defined what name you call to use this Firebase App
    String appName,

    /// This is the unique ID of Firebase Project when created
    String projectId,

    /// This can be found in all three Firebase configuration files,
    /// in google-services.json is "project_number"
    /// in GoogleService-Info.plist is "GCM_SENDER_ID"
    /// in index.html is "messagingSenderId",
    /// mostly numeric,
    /// e.g. "40812308082344"
    String messagingSenderId,
    {IosFirebaseOptions? iosFirebaseOptions,
    WebFirebaseOptions? webFirebaseOptions,
    AndroidFirebaseOptions? androidFirebaseOptions}) async {
  try {
    Firebase.app('$appName');
  } catch (e) {
    if (kIsWeb) {
      if (webFirebaseOptions != null) {
        await Firebase.initializeApp(
            name: appName,
            options: FirebaseOptions(
                apiKey: webFirebaseOptions.apiKey,
                appId: webFirebaseOptions.appId,
                messagingSenderId: messagingSenderId,
                projectId: projectId));
      }
    } else if (Platform.isAndroid) {
      if (androidFirebaseOptions != null) {
        await Firebase.initializeApp(
            name: appName,
            options: FirebaseOptions(
                apiKey: androidFirebaseOptions.apiKey,
                appId: androidFirebaseOptions.appId,
                messagingSenderId: messagingSenderId,
                projectId: projectId));
      }
    } else if (Platform.isIOS) {
      if (iosFirebaseOptions != null) {
        await Firebase.initializeApp(
            name: appName,
            options: FirebaseOptions(
                apiKey: iosFirebaseOptions.apiKey,
                appId: iosFirebaseOptions.appId,
                messagingSenderId: messagingSenderId,
                projectId: projectId));
      }
    }
  }
}

class IosFirebaseOptions {
  /// "API_KEY" in GoogleService-Info.plist, e.g.
  /// "AIxxaSyB7xxxMZNmbn9hQa_u-LxxxCI8o-orYxxjw"
  String apiKey;

  /// "GOOGLE_APP_ID" in GoogleService-Info.plist, e.g.
  /// "1:948370728466:ios:3ddc41aba2qwe74123897a26bef"
  String appId;

  IosFirebaseOptions({required this.apiKey, required this.appId});
}

class WebFirebaseOptions {
  /// "apiKey" in index.html, e.g.
  /// "AIzaSyxxxcFpAxxxqlByw6DjcbNxP6xxxAfIxxx9RQ"
  String apiKey;

  /// "appId" in index.html, e.g.
  /// "1:40823984708239484:web:4c68sodfij309d6c1dbaaa001"
  String appId;

  WebFirebaseOptions({required this.apiKey, required this.appId});
}

class AndroidFirebaseOptions {
  /// "current_key" in google-services.json, e.g.
  /// "AIzaSAsdioj1dyi_nPIDOIFJ33w-LXvSDOIJqJ-erijA"
  String apiKey;

  /// "mobilesdk_app_id" in google-services.json, e.g.
  /// "1:4012323408724:android:cc3adslfkj32188b639238d001"
  String appId;

  AndroidFirebaseOptions({required this.apiKey, required this.appId});
}
