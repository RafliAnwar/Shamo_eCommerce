import 'package:flutter/material.dart';
import 'package:shamo_ecommerce/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: bgColor1,
        title: Text(
          'Checkout Success',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/empty_cart.png',
                width: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'You made a transaction',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Stay at home while we\nprepare your dream shoes',
                style: secondaryTextStyle,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: defaultMargin),
                height: 44,
                width: 196,
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      )),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  child: Text(
                    'Order Other Shoes',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                height: 44,
                width: 196,
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Color(0xff39374B),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      )),
                  onPressed: () {},
                  child: Text(
                    'View My Order',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                        color: Color(0xffB7B6BF)),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
