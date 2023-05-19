import 'package:flutter/material.dart';

const Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);
const Color accentColor = Color.fromRGBO(230, 230, 230, 1);
const Color primaryColor = Color.fromRGBO(73, 160, 235, 1);
const Color hintColor = Color.fromRGBO(133, 145, 158, 1);
const Color textColor = Color.fromRGBO(0, 0, 0, 1);

ThemeData get twitterLightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: hintColor,
        )),
    appBarTheme: _darkThemeAppBarTheme,
    bottomAppBarTheme: const BottomAppBarTheme(elevation: 0, color: backgroundColor),
    bottomNavigationBarTheme: _darkThemeBottomNavigationBarTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide.none))),
    canvasColor: accentColor,
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: textColor),
        backgroundColor: accentColor,
        actionTextColor: primaryColor),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryColor),

    /// [Roboto] is also the default [fontFamily] of Flutter
    fontFamily: 'Roboto',
    textTheme: const TextTheme(

        /// This [TextStyle] is default in [Text]
        bodyMedium: TextStyle(color: textColor)),

    /// See more on [_darkThemeAppBarTheme]
    primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.w900, color: textColor)),
    dividerColor: const Color.fromRGBO(225, 230, 233, 1),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor)

    /// Drawer theme can not apply in [ThemeData], see [Widgets/MyDrawer] to
    /// check [Drawer] setting
    );

AppBarTheme get _darkThemeAppBarTheme => const AppBarTheme(
    elevation: 0,

    /// [titleTextStyle] current not working, wait for Flutter update,
    /// current [titleTextStyle] is replaced by [primaryTextTheme.headline6]
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(color: primaryColor));

BottomNavigationBarThemeData get _darkThemeBottomNavigationBarTheme =>
    const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Color.fromRGBO(230, 230, 230, 0.3),
      selectedItemColor: primaryColor,
      unselectedItemColor: Color.fromRGBO(57, 60, 62, 1),
      selectedIconTheme: IconThemeData(size: 25),
      unselectedIconTheme: IconThemeData(size: 25),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
