import 'package:flutter/material.dart';


ThemeData get twitterLightOutTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromRGBO(17, 19, 22, 1),
    appBarTheme: _darkThemeAppBarTheme,
    bottomNavigationBarTheme: _darkThemeBottomNavigationBarTheme,

    /// [Roboto] is also the default [fontFamily] of Flutter
    fontFamily: 'Roboto',

    textTheme: TextTheme(

      /// This [TextStyle] is default in [Text]
        bodyText2: TextStyle(color: Color.fromRGBO(220, 220, 220, 1))),

    /// See more on [_darkThemeAppBarTheme]
    primaryTextTheme: TextTheme(
        headline6: TextStyle(
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(220, 220, 220, 1))),

    dividerColor: Color.fromRGBO(70, 70, 70, 1)

  /// Drawer theme can not apply in [ThemeData], see [Widgets/MyDrawer] to
  /// check [Drawer] setting
);

AppBarTheme get _darkThemeAppBarTheme => AppBarTheme(
    elevation: 0,

    /// [titleTextStyle] current not working, wait for Flutter update,
    /// current [titleTextStyle] is replaced by [primaryTextTheme.headline6]
    backgroundColor: Color.fromRGBO(17, 19, 22, 1),
    iconTheme: IconThemeData(color: Color.fromRGBO(73, 160, 245, 1)));

BottomNavigationBarThemeData get _darkThemeBottomNavigationBarTheme =>
    BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Color.fromRGBO(42, 42, 40, 0.3),
        selectedItemColor: Color.fromRGBO(73, 160, 245, 1),
        unselectedItemColor: Color.fromRGBO(131, 130, 129, 1),
        selectedIconTheme: IconThemeData(size: 25),
        unselectedIconTheme: IconThemeData(size: 25),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        enableFeedback: true);