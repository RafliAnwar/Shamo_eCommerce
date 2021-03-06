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
import 'package:shamo_ecommerce/providers/page_provider.dart';
import 'package:shamo_ecommerce/providers/product_provider.dart';
import 'package:shamo_ecommerce/providers/transaction_provider.dart';
import 'package:shamo_ecommerce/providers/wishlist_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([//disable landscape orientation
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

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
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/SignIn': (context) => SignInPage(),
          '/SignUp': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit_profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout_success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
