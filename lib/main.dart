import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:start_application/pages/home.dart';
import 'package:start_application/pages/login_screen.dart';
import 'package:start_application/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New App',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.grey[200],
        textTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
            toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
            titleTextStyle: Theme.of(context).textTheme.headline6),
      ),
      // home: Home(),
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        SplashScreen.routeName: (context) => SplashScreen(),
        LogInScreen.routeName: (context) => LogInScreen(),
      },
    );
  }
}
