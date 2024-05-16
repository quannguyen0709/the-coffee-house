import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';

Widget widgetImageAsset(String linkImage) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
    child: Image(
      image: AssetImage(linkImage),
      fit: BoxFit.cover,
    ),
  );
}

Widget widgetImageNetWork(String linkImage) {
  final height = 20.0.hp;
  return ClipRRect(
    borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
    child:CachedNetworkImage(
      imageUrl: linkImage,
      progressIndicatorBuilder: (context, url, downloadProgress) {
         return Container(
          height: height,
        ).redacted(
            context:context ,
            redact: true,
            configuration: RedactedConfiguration(
              animationDuration:
              const Duration(milliseconds: 800), //default
            ));
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
    ),
  );
}
