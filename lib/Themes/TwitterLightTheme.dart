import 'package:flutter/material.dart';

final Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);
final Color accentColor = Color.fromRGBO(230, 230, 230, 1);
final Color primaryColor = Color.fromRGBO(73, 160, 235, 1);
final Color hintColor = Color.fromRGBO(133, 145, 158, 1);
final Color textColor = Color.fromRGBO(0, 0, 0, 1);

ThemeData get twitterLightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: hintColor,
        )),
    appBarTheme: _darkThemeAppBarTheme,
    bottomAppBarTheme: BottomAppBarTheme(elevation: 0, color: backgroundColor),
    bottomNavigationBarTheme: _darkThemeBottomNavigationBarTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: primaryColor,
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide.none))),
    canvasColor: accentColor,
    snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(color: textColor),
        backgroundColor: accentColor,
        actionTextColor: primaryColor),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primaryColor),

    /// [Roboto] is also the default [fontFamily] of Flutter
    fontFamily: 'Roboto',
    textTheme: TextTheme(

        /// This [TextStyle] is default in [Text]
        bodyText2: TextStyle(color: textColor)),

    /// See more on [_darkThemeAppBarTheme]
    primaryTextTheme: TextTheme(
        headline6: TextStyle(fontWeight: FontWeight.w900, color: textColor)),
    dividerColor: Color.fromRGBO(225, 230, 233, 1),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor)

    /// Drawer theme can not apply in [ThemeData], see [Widgets/MyDrawer] to
    /// check [Drawer] setting
    );

AppBarTheme get _darkThemeAppBarTheme => AppBarTheme(
    elevation: 0,

    /// [titleTextStyle] current not working, wait for Flutter update,
    /// current [titleTextStyle] is replaced by [primaryTextTheme.headline6]
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(color: primaryColor));

BottomNavigationBarThemeData get _darkThemeBottomNavigationBarTheme =>
    BottomNavigationBarThemeData(
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
