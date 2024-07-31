import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/membership/membership_entity.dart';

MembershipEntity $MembershipEntityFromJson(Map<String, dynamic> json) {
  final MembershipEntity membershipEntity = MembershipEntity();
  final dynamic error = json['error'];
  if (error != null) {
    membershipEntity.error = error;
  }
  final MembershipProfile? profile = jsonConvert.convert<MembershipProfile>(
      json['profile']);
  if (profile != null) {
    membershipEntity.profile = profile;
  }
  return membershipEntity;
}

Map<String, dynamic> $MembershipEntityToJson(MembershipEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error'] = entity.error;
  data['profile'] = entity.profile.toJson();
  return data;
}

extension MembershipEntityExtension on MembershipEntity {
  MembershipEntity copyWith({
    dynamic error,
    MembershipProfile? profile,
  }) {
    return MembershipEntity()
      ..error = error ?? this.error
      ..profile = profile ?? this.profile;
  }
}

MembershipProfile $MembershipProfileFromJson(Map<String, dynamic> json) {
  final MembershipProfile membershipProfile = MembershipProfile();
  final String? barcode = jsonConvert.convert<String>(json['barcode']);
  if (barcode != null) {
    membershipProfile.barcode = barcode;
  }
  final String? rankName = jsonConvert.convert<String>(json['rank_name']);
  if (rankName != null) {
    membershipProfile.rankName = rankName;
  }
  final int? rankId = jsonConvert.convert<int>(json['rank_id']);
  if (rankId != null) {
    membershipProfile.rankId = rankId;
  }
  final int? bean = jsonConvert.convert<int>(json['bean']);
  if (bean != null) {
    membershipProfile.bean = bean;
  }
  final String? cutOff = jsonConvert.convert<String>(json['cut_off']);
  if (cutOff != null) {
    membershipProfile.cutOff = cutOff;
  }
  final int? beanNeedKeep = jsonConvert.convert<int>(json['bean_need_keep']);
  if (beanNeedKeep != null) {
    membershipProfile.beanNeedKeep = beanNeedKeep;
  }
  final int? beanNeedNext = jsonConvert.convert<int>(json['bean_need_next']);
  if (beanNeedNext != null) {
    membershipProfile.beanNeedNext = beanNeedNext;
  }
  final String? beanExpire = jsonConvert.convert<String>(json['bean_expire']);
  if (beanExpire != null) {
    membershipProfile.beanExpire = beanExpire;
  }
  return membershipProfile;
}

Map<String, dynamic> $MembershipProfileToJson(MembershipProfile entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['barcode'] = entity.barcode;
  data['rank_name'] = entity.rankName;
  data['rank_id'] = entity.rankId;
  data['bean'] = entity.bean;
  data['cut_off'] = entity.cutOff;
  data['bean_need_keep'] = entity.beanNeedKeep;
  data['bean_need_next'] = entity.beanNeedNext;
  data['bean_expire'] = entity.beanExpire;
  return data;
}

extension MembershipProfileExtension on MembershipProfile {
  MembershipProfile copyWith({
    String? barcode,
    String? rankName,
    int? rankId,
    int? bean,
    String? cutOff,
    int? beanNeedKeep,
    int? beanNeedNext,
    String? beanExpire,
  }) {
    return MembershipProfile()
      ..barcode = barcode ?? this.barcode
      ..rankName = rankName ?? this.rankName
      ..rankId = rankId ?? this.rankId
      ..bean = bean ?? this.bean
      ..cutOff = cutOff ?? this.cutOff
      ..beanNeedKeep = beanNeedKeep ?? this.beanNeedKeep
      ..beanNeedNext = beanNeedNext ?? this.beanNeedNext
      ..beanExpire = beanExpire ?? this.beanExpire;
  }
}