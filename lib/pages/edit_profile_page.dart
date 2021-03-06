import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/model/user_model.dart';
import 'package:shamo_ecommerce/providers/auth_provider.dart';
import 'package:shamo_ecommerce/theme.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.only(
            left: defaultMargin,
          ),
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '${user.name}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subTitleColor,
                  )
                )
              ),
            )
          ],
        ),
      );
    }

    Widget userNameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '@${user.username}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subTitleColor,
                  )
                )
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '${user.email}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subTitleColor,
                  )
                )
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    user.profilePhotoUrl,
                  ),
                ),
              ),
            ),
            nameInput(),
            userNameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
