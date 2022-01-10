import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/model/message_model.dart';
import 'package:shamo_ecommerce/model/product_model.dart';
import 'package:shamo_ecommerce/providers/auth_provider.dart';
import 'package:shamo_ecommerce/services/message_service.dart';
import 'package:shamo_ecommerce/theme.dart';
import 'package:shamo_ecommerce/widgets/chat_bubble.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product);

  @override
  _DetailChatPageState createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageService().addMessage(
        user: authProvider.user,
        isFromUser: true,
        product: widget.product,
        message: messageController.text,
      );
      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

    Widget header() {
      return PreferredSize(
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/shop_logo_online.png',
                width: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(70),
      );
    }

    Widget productPreview() {
      return Container(
        decoration: BoxDecoration(
            color: bgColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor, width: 1)),
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        height: 74,
        width: 225,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.product.galleries[0].url,
                width: 54,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.name,
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                'assets/button_close.png',
                width: 22,
              ),
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.product is UninitializedProductModel
                ? SizedBox()
                : productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: bgColor4,
                        borderRadius: BorderRadius.circular(12)),
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: primaryTextStyle.copyWith(fontSize: 14),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Typle Message...',
                          hintStyle: subTitleTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Image.asset(
                    'assets/button_send.png',
                    width: 45,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream:
              MessageService().getMessageByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  children: snapshot.data
                      .map((MessageModel message) => ChatBubble(
                            isSender: message.isFromUser,
                            text: message.message,
                            product: message.product,
                          ))
                      .toList());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
