import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories.dart';
// import 'package:meals_app/screens/meals.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 131, 57, 0),
);

final theme = ThemeData(
  colorScheme: kColorScheme,
  textTheme: GoogleFonts.latoTextTheme(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals management app',
      theme: theme,
      home: const CategoriesScreen(),
      // home: const MealsScreen(
      //   title: 'Some meals content',
      //   meals: dummyMeals,
      // ),
    );
  }
}
