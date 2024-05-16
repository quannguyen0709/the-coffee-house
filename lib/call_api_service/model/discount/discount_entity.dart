import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/discount_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/discount_entity.g.dart';

@JsonSerializable()
class DiscountEntity {
	late DiscountError error;
	late List<DiscountResults> results;

	DiscountEntity();

	factory DiscountEntity.fromJson(Map<String, dynamic> json) => $DiscountEntityFromJson(json);

	Map<String, dynamic> toJson() => $DiscountEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DiscountError {
	@JSONField(name: "error_code")
	dynamic errorCode;
	late String message;
	late String title;
	dynamic extra;

	DiscountError();

	factory DiscountError.fromJson(Map<String, dynamic> json) => $DiscountErrorFromJson(json);

	Map<String, dynamic> toJson() => $DiscountErrorToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DiscountResults {
	late String title;
	dynamic type;
	dynamic count;
	late List<DiscountResultsCampaigns> campaigns;

	DiscountResults();

	factory DiscountResults.fromJson(Map<String, dynamic> json) => $DiscountResultsFromJson(json);

	Map<String, dynamic> toJson() => $DiscountResultsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DiscountResultsCampaigns {
	late String brand;
	@JSONField(name: "coupon_count")
	dynamic couponCount;
	late List<DiscountResultsCampaignsCoupons> coupons;
	late String id;
	late String title;
	late String description;
	@JSONField(name: "end_time")
	late int endTime;
	@JSONField(name: "time_left")
	late String timeLeft;
	late String image;
	@JSONField(name: "discount_rate")
	dynamic discountRate;
	@JSONField(name: "allow_order")
	late bool allowOrder;
	@JSONField(name: "show_all_coupons")
	late bool showAllCoupons;

	DiscountResultsCampaigns();

	factory DiscountResultsCampaigns.fromJson(Map<String, dynamic> json) => $DiscountResultsCampaignsFromJson(json);

	Map<String, dynamic> toJson() => $DiscountResultsCampaignsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DiscountResultsCampaignsCoupons {
	late String barcode;
	dynamic quantity;
	@JSONField(name: "effective_from")
	dynamic effectiveFrom;
	@JSONField(name: "effective_to")
	dynamic effectiveTo;
	@JSONField(name: "end_time")
	late int endTime;
	late String image;

	DiscountResultsCampaignsCoupons();

	factory DiscountResultsCampaignsCoupons.fromJson(Map<String, dynamic> json) => $DiscountResultsCampaignsCouponsFromJson(json);

	Map<String, dynamic> toJson() => $DiscountResultsCampaignsCouponsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}