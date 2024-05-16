import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:redacted/redacted.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/widgets/image_widget/image_widget.dart';

import '../../config/theme/shape/shadow.dart';

class CarouselSliderWidget extends StatelessWidget{

  final CarouselController _carouselController = CarouselController();
  final List<String> itemList;
  final double height;
  List<Widget> listImages =[];

  CarouselSliderWidget({
    required this.itemList,
    required this.height
});

  @override
  Widget build(BuildContext context) {
    final double padding = 5.0.wp;
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(padding),
        decoration: ShadowApp.smallShadow,
    child: carouselSilderWidget(),);
  }

  Widget carouselSilderWidget() {
    double viewportFraction = 1;
    double aspectRatio = 16/9;
    int initPage = 0;
    bool enableInfiniteScroll = true;
    bool autoPlay = true;
    Duration autoPlayInterval = Duration(seconds: 5);
    Duration autoPlayAnimationDuration = Duration(seconds:1);
    var autoPlayCurve=  Curves.fastOutSlowIn;
    bool pauseAutoPlayOnTouch = true;
    Axis scrollDirection = Axis.horizontal;
    bool pauseAutoPlayOnManualNavigate= true;
    bool pauseAutoPlayInFiniteScroll = false;
    bool disableCenter= false;
    bool enlargeCenterPage = false;
    return CarouselSlider(
      items: getImage(),
      options: CarouselOptions(
        height: height,
        viewportFraction: viewportFraction,
        aspectRatio: aspectRatio,
        initialPage: initPage,
        enableInfiniteScroll: enableInfiniteScroll,
        autoPlay: autoPlay,
        autoPlayAnimationDuration: autoPlayAnimationDuration,
        autoPlayCurve:autoPlayCurve,
        autoPlayInterval: autoPlayInterval ,
        scrollDirection: scrollDirection,
        pauseAutoPlayOnTouch: pauseAutoPlayOnTouch,
        pauseAutoPlayOnManualNavigate: pauseAutoPlayOnManualNavigate,
        pauseAutoPlayInFiniteScroll: pauseAutoPlayInFiniteScroll,
        disableCenter: disableCenter,
        enlargeCenterPage: enlargeCenterPage,
        onScrolled: (index) {
          onScroll(index!);
        },
        onPageChanged: (index, reason) {
          onchangePage(index, reason);
        },
      ),
      carouselController: _carouselController,


    );
  }
  List<Widget> getImage(){
    itemList.forEach((element) {listImages.add(widgetImageNetWork(element.toString()));});
    return listImages;
  }


  void onchangePage(int index, CarouselPageChangedReason reason){}
  void onScroll(double index){}

  
}