import 'package:flutter/material.dart';

final ketchyColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.orange,
  primary: Colors.orange,
  secondary: Colors.yellow,
);

final ketchyTheme = ThemeData(
  colorScheme: ketchyColorScheme,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: ketchyColorScheme.primaryContainer,
    foregroundColor: ketchyColorScheme.onPrimaryContainer,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
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
);
