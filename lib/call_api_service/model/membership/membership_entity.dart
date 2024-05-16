import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/membership_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/membership_entity.g.dart';

@JsonSerializable()
class MembershipEntity {
	dynamic error;
	late MembershipProfile profile;

	MembershipEntity();

	factory MembershipEntity.fromJson(Map<String, dynamic> json) => $MembershipEntityFromJson(json);

	Map<String, dynamic> toJson() => $MembershipEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MembershipProfile {
	late String barcode;
	@JSONField(name: "rank_name")
	late String rankName;
	@JSONField(name: "rank_id")
	late int rankId;
	late int bean;
	@JSONField(name: "cut_off")
	late String cutOff;
	@JSONField(name: "bean_need_keep")
	late int beanNeedKeep;
	@JSONField(name: "bean_need_next")
	late int beanNeedNext;
	@JSONField(name: "bean_expire")
	late String beanExpire;

	MembershipProfile();

	factory MembershipProfile.fromJson(Map<String, dynamic> json) => $MembershipProfileFromJson(json);

	Map<String, dynamic> toJson() => $MembershipProfileToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}