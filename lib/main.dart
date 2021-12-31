import 'package:flutter/material.dart';
import 'package:shamo_ecommerce/pages/sign_in_page.dart';
import 'package:shamo_ecommerce/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/SignIn': (context) => SignInPage()
      },
    );
  }
}
