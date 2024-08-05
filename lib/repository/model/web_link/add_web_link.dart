import 'package:the_coffee_house_leanning/call_local/model/rank_infor/rank_infor_entity.dart';
import 'package:the_coffee_house_leanning/repository/model/web_link/web_link.dart';

class AddWebLink{
  WebLink addWebLink(RankInforWebLinks webLinks){
    return WebLink(webLinks.story, webLinks.help, webLinks.pressRelease, webLinks.reward, webLinks.term, webLinks.termVNPay, webLinks.termPrepaid, webLinks.invoicingInstruct);
  }
}