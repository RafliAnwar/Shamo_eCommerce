import 'package:flutter/material.dart';
import 'package:shamo_ecommerce/pages/cart_page.dart';
import 'package:shamo_ecommerce/pages/checkout_page.dart';
import 'package:shamo_ecommerce/pages/checkout_success_page.dart';
import 'package:shamo_ecommerce/pages/detail_chat_page.dart';
import 'package:shamo_ecommerce/pages/edit_profile_page.dart';
import 'package:shamo_ecommerce/pages/home/main_page.dart';
import 'package:shamo_ecommerce/pages/product_page.dart';
import 'package:shamo_ecommerce/pages/sign_in_page.dart';
import 'package:shamo_ecommerce/pages/sign_up_page.dart';
import 'package:shamo_ecommerce/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/SignIn': (context) => SignInPage(),
        '/SignUp': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail_chat': (context) => DetailChatPage(),
        '/edit_profile': (context) => EditProfilePage(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout_success': (context) => CheckoutSuccessPage(),
      },
    );
  }
}
