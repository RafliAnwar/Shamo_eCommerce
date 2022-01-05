import 'package:flutter/material.dart';
import 'package:shamo_ecommerce/theme.dart';

class CartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/image_shoes.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terrex Urban Low',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '\$143,98',
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/button_add.png',
                    width: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2,
                      bottom: 2,
                    ),
                    child: Text(
                      '2',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/button_min.png',
                    width: 16,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icon_remove.png',
                width: 10,
                height: 12,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: alertTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
