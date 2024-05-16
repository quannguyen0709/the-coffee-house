import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';

import '../../call_api_service/model/user/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
  final UserEntity userEntity = UserEntity();
  final dynamic error = json['error'];
  if (error != null) {
    userEntity.error = error;
  }
  final dynamic preFill = json['pre_fill'];
  if (preFill != null) {
    userEntity.preFill = preFill;
  }
  final int? profileStatus = jsonConvert.convert<int>(json['profile_status']);
  if (profileStatus != null) {
    userEntity.profileStatus = profileStatus;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    userEntity.token = token;
  }
  final UserProfile? profile = jsonConvert.convert<UserProfile>(
      json['profile']);
  if (profile != null) {
    userEntity.profile = profile;
  }
  return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error'] = entity.error;
  data['pre_fill'] = entity.preFill;
  data['profile_status'] = entity.profileStatus;
  data['token'] = entity.token;
  data['profile'] = entity.profile.toJson();
  return data;
}

extension UserEntityExtension on UserEntity {
  UserEntity copyWith({
    dynamic error,
    dynamic preFill,
    int? profileStatus,
    String? token,
    UserProfile? profile,
  }) {
    return UserEntity()
      ..error = error ?? this.error
      ..preFill = preFill ?? this.preFill
      ..profileStatus = profileStatus ?? this.profileStatus
      ..token = token ?? this.token
      ..profile = profile ?? this.profile;
  }
}

UserProfile $UserProfileFromJson(Map<String, dynamic> json) {
  final UserProfile userProfile = UserProfile();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userProfile.id = id;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    userProfile.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    userProfile.lastName = lastName;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userProfile.email = email;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    userProfile.birthday = birthday;
  }
  final String? birthdayStr = jsonConvert.convert<String>(json['birthday_str']);
  if (birthdayStr != null) {
    userProfile.birthdayStr = birthdayStr;
  }
  final UserProfilePhone? phone = jsonConvert.convert<UserProfilePhone>(
      json['phone']);
  if (phone != null) {
    userProfile.phone = phone;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    userProfile.avatar = avatar;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    userProfile.gender = gender;
  }
  final String? barcode = jsonConvert.convert<String>(json['barcode']);
  if (barcode != null) {
    userProfile.barcode = barcode;
  }
  final int? rankId = jsonConvert.convert<int>(json['rank_id']);
  if (rankId != null) {
    userProfile.rankId = rankId;
  }
  return userProfile;
}

Map<String, dynamic> $UserProfileToJson(UserProfile entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['email'] = entity.email;
  data['birthday'] = entity.birthday;
  data['birthday_str'] = entity.birthdayStr;
  data['phone'] = entity.phone.toJson();
  data['avatar'] = entity.avatar;
  data['gender'] = entity.gender;
  data['barcode'] = entity.barcode;
  data['rank_id'] = entity.rankId;
  return data;
}

extension UserProfileExtension on UserProfile {
  UserProfile copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? birthday,
    String? birthdayStr,
    UserProfilePhone? phone,
    String? avatar,
    int? gender,
    String? barcode,
    int? rankId,
  }) {
    return UserProfile()
      ..id = id ?? this.id
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..email = email ?? this.email
      ..birthday = birthday ?? this.birthday
      ..birthdayStr = birthdayStr ?? this.birthdayStr
      ..phone = phone ?? this.phone
      ..avatar = avatar ?? this.avatar
      ..gender = gender ?? this.gender
      ..barcode = barcode ?? this.barcode
      ..rankId = rankId ?? this.rankId;
  }
}

UserProfilePhone $UserProfilePhoneFromJson(Map<String, dynamic> json) {
  final UserProfilePhone userProfilePhone = UserProfilePhone();
  final String? regionCode = jsonConvert.convert<String>(json['region_code']);
  if (regionCode != null) {
    userProfilePhone.regionCode = regionCode;
  }
  final String? phoneNumber = jsonConvert.convert<String>(json['phone_number']);
  if (phoneNumber != null) {
    userProfilePhone.phoneNumber = phoneNumber;
  }
  return userProfilePhone;
}

Map<String, dynamic> $UserProfilePhoneToJson(UserProfilePhone entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['region_code'] = entity.regionCode;
  data['phone_number'] = entity.phoneNumber;
  return data;
}

extension UserProfilePhoneExtension on UserProfilePhone {
  UserProfilePhone copyWith({
    String? regionCode,
    String? phoneNumber,
  }) {
    return UserProfilePhone()
      ..regionCode = regionCode ?? this.regionCode
      ..phoneNumber = phoneNumber ?? this.phoneNumber;
  }
}