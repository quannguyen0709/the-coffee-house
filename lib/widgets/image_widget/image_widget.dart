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

Widget widgetImageNetWork(String linkImage,
    {double? height, double? width, bool? topBorder}) {
  final heightContainer = height ?? 20.0.hp;
  final noBorder = (topBorder == null)
      ? BorderRadius.circular(ShapeApp.extraLarge)
      : (topBorder!
          ? BorderRadius.only(
              topRight: Radius.circular(ShapeApp.extraLarge),
              topLeft: Radius.circular(ShapeApp.extraLarge))
          : BorderRadius.circular(0));

  if (height == null && width == null) {
    return ClipRRect(
      borderRadius: noBorder,
      child: CachedNetworkImage(
        imageUrl: linkImage,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: Container(
              child: CircularProgressIndicator(
                value: downloadProgress.downloaded.toDouble(),
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(ShapeApp.extraLarge),
          topLeft: Radius.circular(ShapeApp.extraLarge)),
      child: Container(
        height: height,
        width: width,
        child: CachedNetworkImage(
          imageUrl: linkImage,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Container(
              height: heightContainer,
            ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  animationDuration:
                      const Duration(milliseconds: 50), //default
                ));
          },
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
