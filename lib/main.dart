import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/pages/cart_page.dart';
import 'package:shamo_ecommerce/pages/checkout_page.dart';
import 'package:shamo_ecommerce/pages/checkout_success_page.dart';
import 'package:shamo_ecommerce/pages/detail_chat_page.dart';
import 'package:shamo_ecommerce/pages/edit_profile_page.dart';
import 'package:shamo_ecommerce/pages/home/main_page.dart';
import 'package:shamo_ecommerce/pages/sign_in_page.dart';
import 'package:shamo_ecommerce/pages/sign_up_page.dart';
import 'package:shamo_ecommerce/pages/splash_page.dart';
import 'package:shamo_ecommerce/providers/auth_provider.dart';
import 'package:shamo_ecommerce/providers/cart_provider.dart';
import 'package:shamo_ecommerce/providers/product_provider.dart';
import 'package:shamo_ecommerce/providers/wishlist_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/SignIn': (context) => SignInPage(),
          '/SignUp': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail_chat': (context) => DetailChatPage(),
          '/edit_profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout_success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
