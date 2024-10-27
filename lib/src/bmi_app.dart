import 'package:bmi_calculator/src/providers/bmi_provider.dart';
import 'package:bmi_calculator/src/screens/calc_screen.dart';
import 'package:bmi_calculator/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BmiProvider(),
      child: MaterialApp(
        title: 'BMI Calculator',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            brightness: Brightness.dark,
          ),
        ),

        initialRoute: '/', // home: const HomeScreen(),
        routes: {
          '/': (BuildContext ctx) => const HomeScreen(),
          '/calc': (BuildContext ctx) => const CalcScreen(),
        },
      ),
    );
  }
}
