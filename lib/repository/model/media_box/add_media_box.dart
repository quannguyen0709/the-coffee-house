import 'package:the_coffee_house_leanning/call_api_service/model/media_box/media_box_entity.dart';
import 'package:the_coffee_house_leanning/repository/model/media_box/media_box.dart';

class AddMediaBox{
  List<MediaBox> addMediaBox( MediaBoxEntity mediaBoxEntity){
    List<MediaBox> lisMediaBox = [];
    List<MediaBoxData> listMediaBoxData = mediaBoxEntity.data;
    listMediaBoxData.forEach((element) {
      lisMediaBox.add(MediaBox( element.iconRespone));
    });
    return lisMediaBox;
  }
}