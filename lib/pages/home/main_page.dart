import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/pages/home/chat_page.dart';
import 'package:shamo_ecommerce/pages/home/home_page.dart';
import 'package:shamo_ecommerce/pages/home/profile_page.dart';
import 'package:shamo_ecommerce/pages/home/wishlist_page.dart';
import 'package:shamo_ecommerce/providers/page_provider.dart';
import 'package:shamo_ecommerce/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    PageProvider pageProvider = Provider.of<PageProvider>(context);


    Widget cartButton() {
      return FloatingActionButton(
          backgroundColor: secondaryColor,
          child: Image.asset(
            'assets/icon_cart.png',
            width: 20,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          });
    }

    Widget customBotNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BottomNavigationBar(
            onTap: (value) {
              pageProvider.currentIndex = value;
            },
            currentIndex: pageProvider.currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: bgColor4,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 21,
                      color:
                          pageProvider.currentIndex == 0 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10, right: 40),
                    child: Image.asset(
                      'assets/icon_chat.png',
                      width: 20,
                      color:
                          pageProvider.currentIndex == 1 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10, left: 40),
                    child: Image.asset(
                      'assets/icon_wishlist.png',
                      width: 20,
                      color:
                          pageProvider.currentIndex == 2 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_profile.png',
                      width: 18,
                      color:
                          pageProvider.currentIndex == 3 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: pageProvider.currentIndex == 0 ? bgColor1 : bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBotNav(),
      body: body(),
    );
  }
}
