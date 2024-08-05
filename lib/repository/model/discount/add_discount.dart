import 'package:the_coffee_house_leanning/call_api_service/model/discount/discount_entity.dart';

import 'discount.dart';

class AddDiscount{
  List<DiscountModel> addListDiscount(DiscountEntity discountEntityt){
    List<DiscountModel> listDiscountModel = [];
    discountEntityt.results.forEach((element) { 
      element.campaigns.forEach((elementDiscountResultsCampaigns) { 
        listDiscountModel.add(
          DiscountModel(
              elementDiscountResultsCampaigns.brand, addCoupons(elementDiscountResultsCampaigns.coupons.first), elementDiscountResultsCampaigns.id, elementDiscountResultsCampaigns.title, elementDiscountResultsCampaigns.description, elementDiscountResultsCampaigns.endTime, elementDiscountResultsCampaigns.timeLeft, elementDiscountResultsCampaigns.image, elementDiscountResultsCampaigns.discountRate == null ? 0: elementDiscountResultsCampaigns.discountRate, elementDiscountResultsCampaigns.allowOrder, elementDiscountResultsCampaigns.showAllCoupons)
        );
      });
    });
    return listDiscountModel;
  }

  Coupons addCoupons(DiscountResultsCampaignsCoupons coupons) {

    return Coupons(coupons.barcode, coupons.image, coupons.endTime);
  }
}