import 'package:the_coffee_house_leanning/call_local/model/rank_infor/rank_infor_entity.dart';
import 'package:the_coffee_house_leanning/repository/model/rank_infor/rank_infor_model.dart';

class AddRankInfor{

  List<RankInfor> addRankInfor (RankInforEntity rankInforEntity){
    List<RankInfor> listRanKInfor = [];
    if (rankInforEntity.rankInfo != null) {
      rankInforEntity.rankInfo!.forEach((element) {
        listRanKInfor.add(RankInfor(element.id.toString(), element.name, element.min , element.max, element.icon, addBenenfit(element.benefits)));
      });
    }
    return listRanKInfor;
  }

  List<Benefit> addBenenfit (List<dynamic> list){
    List<Benefit> listBenefit = [];
    if(list.isNotEmpty){
      list.forEach((element) {
        listBenefit.add(Benefit(element['icon'], element['name']));
      });
    }
    return listBenefit;
  }

}