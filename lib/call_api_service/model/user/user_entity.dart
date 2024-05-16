import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/user_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity {
	dynamic error;
	@JSONField(name: "pre_fill")
	dynamic preFill;
	@JSONField(name: "profile_status")
	late int profileStatus;
	late String token;
	late UserProfile profile;

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserProfile {
	late int id;
	@JSONField(name: "first_name")
	late String firstName;
	@JSONField(name: "last_name")
	late String lastName;
	late String email;
	late String birthday;
	@JSONField(name: "birthday_str")
	late String birthdayStr;
	late UserProfilePhone phone;
	late String avatar;
	late int gender;
	late String barcode;
	@JSONField(name: "rank_id")
	late int rankId;

	UserProfile();

	factory UserProfile.fromJson(Map<String, dynamic> json) => $UserProfileFromJson(json);

	Map<String, dynamic> toJson() => $UserProfileToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserProfilePhone {
	@JSONField(name: "region_code")
	late String regionCode;
	@JSONField(name: "phone_number")
	late String phoneNumber;

	UserProfilePhone();

	factory UserProfilePhone.fromJson(Map<String, dynamic> json) => $UserProfilePhoneFromJson(json);

	Map<String, dynamic> toJson() => $UserProfilePhoneToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}