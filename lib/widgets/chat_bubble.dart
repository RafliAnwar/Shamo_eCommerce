import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo_ecommerce/model/product_model.dart';
import 'package:shamo_ecommerce/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final ProductModel product;

  ChatBubble({
    this.isSender = false,
    this.text = '',
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 12),
        width: 230,
        decoration: BoxDecoration(
          color: isSender ? bgColor5 : bgColor4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? 12 : 0),
            topRight: Radius.circular(isSender ? 0 : 12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.galleries[0].url,
                    width: 70,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: primaryTextStyle,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$${product.price}',
                        style: priceTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Add to Cart',
                    style: purpleTextStyle,
                  ),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: primaryColor)),
                ),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.poppins(
                      color: bgColor5,
                      fontWeight: medium,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                )
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: defaultMargin),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          product is UninitializedProductModel ?  SizedBox() : productPreview(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: isSender ? bgColor5 : bgColor4,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 12 : 0),
                      topRight: Radius.circular(isSender ? 0 : 12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    text,
                    style: primaryTextStyle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
