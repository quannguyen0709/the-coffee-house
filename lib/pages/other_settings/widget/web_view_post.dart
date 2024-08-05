import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../repository/model/new_feed/new_feed.dart';

class WebView extends StatefulWidget {
  String linkUrl;
  String title;
  WebViewController _webViewController = WebViewController();
  WebView({super.key ,required this.linkUrl, required this.title});


  @override
  State<StatefulWidget> createState() => _WebViewPost();
}

class _WebViewPost extends State<WebView> {
  double progressLoad = 0.0;


  @override
  void initState() {
    // TODO: implement initState

    widget._webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
     // ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          setState(() {
            progressLoad = progress/100;
          });
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
      ),
      )
      ..enableZoom(false)
      ..loadRequest(Uri.parse(widget.linkUrl));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: bodySliver(),
    );
  }

  Widget bodySliver() {
    return CustomScrollView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        appBarSliver(),
        bodyWidget()
      ],
    );
  }


  Widget bodyWidget() {
    return SliverFillRemaining(
      hasScrollBody: true,
      child: Column(
        children: [
          progressLoad == 1.0 ? Container() : Container(
            height:  0.5.wp,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.blue,
              value: progressLoad,
            ),
          ),
          Expanded(
            child: WebViewWidget(
              controller:   widget._webViewController,),
          )
        ],
      ),
    );
  }

  Widget appBarSliver() {
    final color = Colors.white;
    return SliverAppBar(
      backgroundColor: color,
      pinned: false,
      floating: true,
      snap: false ,
      shadowColor: Colors.black12,
      toolbarHeight: 6.0.hp,
      title: titleWidget(),
      titleTextStyle: TextStyleApp.fontNotoSansLarge.copyWith(fontSize: 20.0, color:  Colors.black),
      actions: [
        actionRight()
      ],
    );
  }

  Widget actionLeft() {
    IconData icon = Icons.arrow_left;
    double margin = 5.0.wp;
    return Container(
      margin: EdgeInsets.only(left: margin, top: margin, bottom: margin),
      child: Icon(icon, ),
    );
  }

  Widget actionRight() {
    IconData iconData = Icons.send_outlined;
    return Container(
      margin: EdgeInsets.only(right:  5.0.wp),
      child: Icon(iconData),
    );
  }

  Widget titleWidget() {
    TextStyle textStyle = TextStyleApp.fontNotoSansLarge.copyWith(fontSize: 20.0);
    double margin = 5.0.wp;
    return Container(
      //margin: EdgeInsets.all(margin),
      child: Text(widget.title, style: textStyle,),
    );
  }


}
