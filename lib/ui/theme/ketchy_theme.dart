import 'package:flutter/material.dart';

final ketchyColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.orange,
  primary: Colors.orange,
  secondary: Colors.yellow,
);

final ketchyTheme = ThemeData(
  colorScheme: ketchyColorScheme,
  useMaterial3: true,
  shadowColor: Colors.black,
  appBarTheme: AppBarTheme(
    elevation: 8,
    shadowColor: Colors.black,
    backgroundColor: ketchyColorScheme.primaryContainer,
    foregroundColor: ketchyColorScheme.onPrimaryContainer,
    titleTextStyle: const TextStyle(
      fontFamily: 'メイリオ',
      fontSize: 24,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 8,
    type: BottomNavigationBarType.fixed,
    backgroundColor: ketchyColorScheme.primaryContainer,
    selectedItemColor: ketchyColorScheme.primary,
    unselectedItemColor: ketchyColorScheme.onSurface.withOpacity(0.7),
  ),
  listTileTheme: const ListTileThemeData(
    style: ListTileStyle.list,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ketchyColorScheme.secondary,
    foregroundColor: Colors.black,
  ),
  scaffoldBackgroundColor: ketchyColorScheme.secondary.withAlpha(50),
  cardTheme: const CardTheme(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    elevation: 8,
    shadowColor: Colors.black,
    shape: ContinuousRectangleBorder(),
  ),
);
