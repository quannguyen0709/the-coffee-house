import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';

class BottomNavigationItem {
  String text;
  IconData icon;

  BottomNavigationItem({required this.icon, required this.text});
}

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget(
      {required this.listItem,
      required this.selectItem,
      required this.color,
      required this.selectColor,
      required this.backGroundColor});

  List<BottomNavigationItem> listItem;
  final void Function(int item) selectItem;
  Color color;
  List<Color> selectColor;
  Color backGroundColor;

  @override
  State<StatefulWidget> createState() => _BottomNavigationWidget();
}

class _BottomNavigationWidget extends State<BottomNavigationWidget> {
  double height = 8.3.hp;
  int _selectItem = 0;
  double elevation = 4.0;
  Color shadow = Colors.blue;
  double padding = 0;
  double shape = ShapeApp.medium;
  double flex = 19.0.wp;
  NeverScrollableScrollPhysics physics = NeverScrollableScrollPhysics();
  void onSelect(int item) {
    setState(() {
      _selectItem = item;
      widget.selectItem(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bottomAppBar();
  }

  Widget bottomAppBar() {
    return BottomAppBar(
      child: buildWidgetBottomNavigation(),
      color: widget.backGroundColor,
      height:height + 5.0 ,
      elevation: elevation,
      shadowColor: shadow,
      shape: CircularNotchedRectangle(),
    );
  }

  Widget buildWidgetBottomNavigation() {
    return ListView.builder(
      physics: physics,
      scrollDirection: Axis.horizontal,
      itemCount: widget.listItem.length,
      itemBuilder: (context, index) {
        return  itemWidgetNavigation(_selectItem == index, index);
      },
    );
  }

  Widget itemWidgetNavigation(bool select, int item) {
    var fontFamily = TextStyleApp.fontNotoSansButton;

    Color colorItemIcon = select ? widget.selectColor.first: widget.color;
    Color colorItemText = select ? widget.selectColor.last: widget.color;

    return GestureDetector(
      onTap: () {
        onSelect(item);
      },
      child: SizedBox(
        height: height,
        width: flex ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.listItem[item].icon, color: colorItemIcon,),
            Text(widget.listItem[item].text,
                style: fontFamily.copyWith(color: colorItemText)),
          ],
        ),
      ),
    );
  }
}
