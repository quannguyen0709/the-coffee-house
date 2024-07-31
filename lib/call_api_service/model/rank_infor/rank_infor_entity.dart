import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/rank_infor_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/rank_infor_entity.g.dart';

@JsonSerializable()
class RankInforEntity {
	dynamic error;
	@JSONField(name: "last_update")
	late int lastUpdate = 0;
	@JSONField(name: "call_center")
	late String callCenter = '';
	@JSONField(name: "rank_info")
	late List<RankInforRankInfo> rankInfo = [];
	@JSONField(name: "web_links")
	late RankInforWebLinks webLinks;
	@JSONField(name: "ping_device_connected")
	late String pingDeviceConnected = '';
	@JSONField(name: "update_optional")
	late bool updateOptional = false;
	@JSONField(name: "update_required")
	late bool updateRequired = false;
	@JSONField(name: "shipping_freq")
	late int shippingFreq = 0;
	@JSONField(name: "auth_haravan")
	late String authHaravan = '';
	@JSONField(name: "staging_host")
	late String stagingHost = '';
	@JSONField(name: "gms_api_keys")
	late List<String> gmsApiKeys = [];

	RankInforEntity();

	factory RankInforEntity.fromJson(Map<String, dynamic> json) => $RankInforEntityFromJson(json);

	Map<String, dynamic> toJson() => $RankInforEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class RankInforRankInfo {
	late int id = 0;
	late String name = '';
	late int min = 0;
	late int max = 0;
	late List<String> gradients = [];
	late String icon = '';
	late List<dynamic> benefits = [];

	RankInforRankInfo();

	factory RankInforRankInfo.fromJson(Map<String, dynamic> json) => $RankInforRankInfoFromJson(json);

	Map<String, dynamic> toJson() => $RankInforRankInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class RankInforWebLinks {
	late String story = '';
	late String help = '';
	@JSONField(name: "press_release")
	late String pressRelease = '';
	late String reward = '';
	late String term = '';
	late String termVNPay = '';
	dynamic termPrepaid;
	late String invoicingInstruct = '';

	RankInforWebLinks();

	factory RankInforWebLinks.fromJson(Map<String, dynamic> json) => $RankInforWebLinksFromJson(json);

	Map<String, dynamic> toJson() => $RankInforWebLinksToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}