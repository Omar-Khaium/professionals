import 'package:flutter/material.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/views/routes/route_attendance.dart';
import 'package:professionals/src/views/routes/route_auth.dart';
import 'package:professionals/src/views/routes/route_forget_password.dart';
import 'package:professionals/src/views/routes/route_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Professionals',
      theme: ThemeData(
        primarySwatch: themeProvider.accentColor,
        accentColor: themeProvider.accentColor,
        backgroundColor: themeProvider.backgroundColor,
        canvasColor: themeProvider.backgroundColor,
        shadowColor: themeProvider.shadowColor,
        indicatorColor: themeProvider.accentColor,
        cursorColor: themeProvider.accentColor,
        iconTheme: IconThemeData(color: themeProvider.iconColor, size: 20),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: themeProvider.accentColor), actionsIconTheme: IconThemeData(color: themeProvider.accentColor)),
      ),
      home: AttendanceRoute(),
      routes: {
        AuthRoute().route: (context) => AuthRoute(),
        ForgetPasswordRoute().route: (context) => ForgetPasswordRoute(),
        HomeRoute().route: (context) => HomeRoute(),
        AttendanceRoute().route: (context) => AttendanceRoute(),
      },
    );
  }
}

// ignore: must_be_immutable
class LauncherRoute extends StatelessWidget {
  bool isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    if (isFirstTime) {
      isFirstTime = false;
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.of(context).pushReplacementNamed(AuthRoute().route);
      });
    }

    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      body: Center(
        child: FlutterLogo(
          size: 42,
        ),
      ),
    );
  }
}
