import 'package:flutter/material.dart';

ThemeData get twitterDarkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color.fromRGBO(17, 19, 22, 1),
    primaryColor: const Color.fromRGBO(73, 160, 235, 1),
    inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Color.fromRGBO(113, 118, 124, 1),
        )),
    appBarTheme: _darkThemeAppBarTheme,
    bottomAppBarTheme:
        const BottomAppBarTheme(elevation: 0, color: Color.fromRGBO(17, 19, 22, 1)),
    bottomNavigationBarTheme: _darkThemeBottomNavigationBarTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(73, 160, 235, 1),
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide.none))),
    canvasColor: const Color.fromRGBO(25, 26, 27, 1),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: Color.fromRGBO(220, 220, 220, 1)),
        backgroundColor: Color.fromRGBO(17, 19, 22, 1),
        actionTextColor: Color.fromRGBO(73, 160, 235, 1)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(73, 160, 235, 1)),

    /// [Roboto] is also the default [fontFamily] of Flutter
    fontFamily: 'Roboto',
    textTheme: const TextTheme(

        /// This [TextStyle] is default in [Text]
        bodyMedium: TextStyle(color: Color.fromRGBO(220, 220, 220, 1))),

    /// See more on [_darkThemeAppBarTheme]
    primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(220, 220, 220, 1))),
    dividerColor: const Color.fromRGBO(70, 70, 70, 1),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: const Color.fromRGBO(73, 160, 235, 0.3))

    /// Drawer theme can not apply in [ThemeData], see [Widgets/MyDrawer] to
    /// check [Drawer] setting
    );

AppBarTheme get _darkThemeAppBarTheme => const AppBarTheme(
    elevation: 0,

    /// [titleTextStyle] current not working, wait for Flutter update,
    /// current [titleTextStyle] is replaced by [primaryTextTheme.headline6]
    backgroundColor: Color.fromRGBO(17, 19, 22, 1),
    iconTheme: IconThemeData(color: Color.fromRGBO(73, 160, 245, 1)));

BottomNavigationBarThemeData get _darkThemeBottomNavigationBarTheme =>
    const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Color.fromRGBO(42, 42, 40, 0.3),
      selectedItemColor: Color.fromRGBO(73, 160, 245, 1),
      unselectedItemColor: Color.fromRGBO(131, 130, 129, 1),
      selectedIconTheme: IconThemeData(size: 25),
      unselectedIconTheme: IconThemeData(size: 25),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
