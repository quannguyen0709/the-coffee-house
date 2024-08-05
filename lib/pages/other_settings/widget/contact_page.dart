import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';

import '../../../config/theme/color/color_app.dart';
import '../../../config/theme/text/text_app.dart';
import '../../../constants/app.dart';
import 'list_item_widget.dart';


class ContactPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final heightStatusBar = AppConstants.heightStatusBar(context);
    return Scaffold(
      body: bodyPage(heightStatusBar, context),
    );
  }

  Widget bodyPage(double heightStatusBar, BuildContext context) {
    List<ItemData> listItemData = [
      ItemData('Tổng đài', Icons.call_outlined,actionClick: actionClick, description: AppConstants.CALL_NUMBER),
      ItemData('Email', Icons.email_outlined,actionClick:  actionClick, description: AppConstants.ADDRESS_EMAIL),
      ItemData( 'Website', Icons.public, actionClick:  actionClick, description: AppConstants.ADDRESS_WEBSITE),
      ItemData( 'Facebook', Icons.facebook, actionClick: actionClick, description: AppConstants.ADDRESS_FACEBOOK)
    ];
    Widget listItemWidget = ListItemWidget().listItemOptionContact(listItemData);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: heightStatusBar),
          child: Container(
            padding: EdgeInsets.all(5.0.wp),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(
                        color: ColorApp.backgourdGrey.withOpacity(0.2)))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: 7.0.wp,
                  ),
                ),
                Expanded(
                    child: Text(
                      'Liên hệ và góp ý',
                      style: TextStyleApp.fontNotoSansLarge.copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
          ),
        ),
        Expanded(
            child: listItemWidget)
      ]
    );
  }

  void actionClick(String url, String name,){

  }
}