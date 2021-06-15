# liquidity_gallery

A gallery for ellie & logistized app

## Getting Started

## Installation

```yaml
liquidity_gallery:
  git:
    url: https://github.com/LiquidityGallery/liquidity_gallery.git
    ref: main
```

### To use Location

#### IOS

Add this lines in ```ios/Runner/Info.plist```before end of 'dict'

```
<key>NSLocationWhenInUseUsageDescription</key>
<string>Privacy - Location When In Use Usage Description</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Privacy - Location Always and When In Use Usage Description</string>
```

#### Android

Add this lines in ```android/app/src/main/AndroidManifest.xml``` after manifest and before application

```xml

<uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
```

### Google Map

#### IOS

Add this lines to ```ios/Runner/AppDelegate.swift```

```
import UIKit
import Flutter
/// Add this line
import GoogleMaps
///

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    /// Add this line
    GMSServices.provideAPIKey("YOUR KEY HERE")
    ///
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

```

#### Android

Add this lines in ```android/app/src/main/AndroidManifest.xml``` after application

```xml

<meta-data android:name="com.google.android.geo.API_KEY"
           android:value="YOUR KEY HERE"/>
```

## Content

### Themes

TwitterLightOutTheme

### Widgets

StartEndDatePicker
