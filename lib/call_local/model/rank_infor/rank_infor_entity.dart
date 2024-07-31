import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/rank_infor_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/rank_infor_entity.g.dart';

@JsonSerializable()
class RankInforEntity {
	dynamic error;
	@JSONField(name: "last_update")
	int? lastUpdate;
	@JSONField(name: "call_center")
	String? callCenter;
	@JSONField(name: "rank_info")
	List<RankInforRankInfo>? rankInfo;
	@JSONField(name: "web_links")
	RankInforWebLinks? webLinks;
	@JSONField(name: "ping_device_connected")
	String? pingDeviceConnected;
	@JSONField(name: "update_optional")
	bool? updateOptional;
	@JSONField(name: "update_required")
	bool? updateRequired;
	@JSONField(name: "shipping_freq")
	int? shippingFreq;
	@JSONField(name: "auth_haravan")
	String? authHaravan;
	@JSONField(name: "staging_host")
	String? stagingHost;
	@JSONField(name: "gms_api_keys")
	List<String>? gmsApiKeys;

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
	int? id;
	String? name;
	int? min;
	int? max;
	List<String>? gradients;
	String? icon;
	List<dynamic>? benefits;

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
	String? story;
	String? help;
	@JSONField(name: "press_release")
	String? pressRelease;
	String? reward;
	String? term;
	String? termVNPay;
	dynamic termPrepaid;
	String? invoicingInstruct;

	RankInforWebLinks();

	factory RankInforWebLinks.fromJson(Map<String, dynamic> json) => $RankInforWebLinksFromJson(json);

	Map<String, dynamic> toJson() => $RankInforWebLinksToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}