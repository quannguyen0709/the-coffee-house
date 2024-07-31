import 'package:the_coffee_house_leanning/call_api_service/model/media_box/media_box_entity.dart';
import 'package:the_coffee_house_leanning/repository/model/media_box/media_box.dart';

class AddMediaBox{
  List<MediaBox> addMediaBox( MediaBoxEntity mediaBoxEntity){
    List<MediaBox> lisMediaBox = [];
    List<MediaBoxData> listMediaBoxData = mediaBoxEntity.data;
    listMediaBoxData.forEach((element) {
      element.icon.isNotEmpty ? lisMediaBox.add(MediaBox( icon:   element.icon)) : (element.iconWeb.isNotEmpty ? lisMediaBox.add(MediaBox(icon: element.iconWeb)) : null);
    });
    return lisMediaBox;
  }
}