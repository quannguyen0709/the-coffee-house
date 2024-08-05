import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';

class TicketClipper extends CustomClipper<Path> {

  final numberOfSmallClips ;


  TicketClipper(this.numberOfSmallClips);

  @override
  Path getClip(Size size) {
    var path = Path();
    final clipPath = Path();

    final clipCenterX = size.width * 0.35;

    final borderRadius = ShapeApp.extraLarge;

    final clipRadius = ShapeApp.medium;

    // Khoảng cách từ vết cắt lớn đến các vết cắt nhỏ
    final clipPadding = 2.0;

    // Bán kính của vết cắt
    final smallClipRadius = 2.0;

    // Khoảng cách có thể render các vết cắt
    final clipContainerSize = size.height - clipRadius * 2 - clipPadding * 2;

    // Khoảng trống mà một vết cắt có thể hiển thị (trên hình mình gọi là clipbox)
    final smallClipBoxSize = clipContainerSize / numberOfSmallClips;

    // Khoảng trống thừa (padding) của clipbox với vết cắt
    final smallClipPadding = (smallClipBoxSize - smallClipRadius * 2) / 2;

    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    ));
    // circle on the left
    clipPath.addOval(Rect.fromCircle(
      center: Offset(clipCenterX, 0),
      radius: clipRadius,
    ));

    // circle on the right
    clipPath.addOval(Rect.fromCircle(
      center: Offset(clipCenterX, size.height),
      radius: clipRadius,
    ));



    final smallClipCenterOffsets = List.generate(numberOfSmallClips, (index) {
      // tọa độ mép bên trái của clipbox
      // Vd như clipbox thứ 2 sẽ tính bằng cách:
      // bán kính của vết cắt lớn + padding giữa vết cắt lớn và clipbox + width của clipbox thứ nhất
      final boxX = clipRadius + clipPadding + smallClipBoxSize * index;

      // Tọa độ tâm của clipbox (và cũng là tâm của vết cắt nhỏ, tính bằng cách:
      // tọa độ của box hiện tại + padding + radius của vết cắt nhỏ
      final centerY= boxX + smallClipPadding + smallClipRadius;

      return Offset(clipCenterX, centerY);
    });

    smallClipCenterOffsets.forEach((centerOffset) {
      clipPath.addOval(Rect.fromCircle(
        center: centerOffset,
        radius: smallClipRadius,
      ));
    });

    final ticketPath = Path.combine(
      PathOperation.reverseDifference,
      clipPath,
      path,
    );

    return ticketPath;
  }




  @override
  bool shouldReclip(TicketClipper old) => old.numberOfSmallClips != numberOfSmallClips;
}