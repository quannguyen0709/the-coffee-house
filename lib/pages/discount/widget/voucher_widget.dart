import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/discount/widget/ticket_clipper_widget.dart';
import 'package:the_coffee_house_leanning/repository/model/discount/discount.dart';
import 'package:the_coffee_house_leanning/widgets/image_widget/image_widget.dart';

import '../../../config/theme/color/color_app.dart';
import '../../../config/theme/shape/shape_app.dart';

class VoucherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  Widget item(DiscountModel discountModel) {
    final slipString = discountModel.time_left.split('>').first != discountModel.time_left
        ? discountModel.time_left.split('>').elementAt(1).split('<').first
        : discountModel.time_left;
    final textStyleAppTitle = TextStyleApp.fontNotoSansTitle;
    final textStyleAppDescription = TextStyleApp.fontNotoSansDescription
        .copyWith(color: ColorApp.primaryColorSwatch.shade700);
    return ClipPath(
      clipper: TicketClipper(15),
      child: Container(
          height: 30.0.wp,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 35,
                child: Container(
                  margin: EdgeInsets.all(4.0.wp),
                  alignment: Alignment.center,
                  child: widgetImageNetWork(discountModel.image),
                ),
              ),
              Expanded(
                  flex: 65,
                  child: Container(
                    margin: EdgeInsets.all(5.0.wp),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          discountModel.title,
                          softWrap: true,
                          style: textStyleAppTitle,
                        ),
                        Container(
                          height: 1.0.wp,
                        ),
                        Text(
                          slipString,
                          style: textStyleAppDescription,
                          softWrap: true,
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
