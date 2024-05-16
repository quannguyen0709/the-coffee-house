import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';

import '../../call_api_service/model/discount/discount_entity.dart';

DiscountEntity $DiscountEntityFromJson(Map<String, dynamic> json) {
  final DiscountEntity discountEntity = DiscountEntity();
  final DiscountError? error = jsonConvert.convert<DiscountError>(
      json['error']);
  if (error != null) {
    discountEntity.error = error;
  }
  final List<DiscountResults>? results = (json['results'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<DiscountResults>(e) as DiscountResults)
      .toList();
  if (results != null) {
    discountEntity.results = results;
  }
  return discountEntity;
}

Map<String, dynamic> $DiscountEntityToJson(DiscountEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error'] = entity.error.toJson();
  data['results'] = entity.results.map((v) => v.toJson()).toList();
  return data;
}

extension DiscountEntityExtension on DiscountEntity {
  DiscountEntity copyWith({
    DiscountError? error,
    List<DiscountResults>? results,
  }) {
    return DiscountEntity()
      ..error = error ?? this.error
      ..results = results ?? this.results;
  }
}

DiscountError $DiscountErrorFromJson(Map<String, dynamic> json) {
  final DiscountError discountError = DiscountError();
  final dynamic errorCode = json['error_code'];
  if (errorCode != null) {
    discountError.errorCode = errorCode;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    discountError.message = message;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    discountError.title = title;
  }
  final dynamic extra = json['extra'];
  if (extra != null) {
    discountError.extra = extra;
  }
  return discountError;
}

Map<String, dynamic> $DiscountErrorToJson(DiscountError entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error_code'] = entity.errorCode;
  data['message'] = entity.message;
  data['title'] = entity.title;
  data['extra'] = entity.extra;
  return data;
}

extension DiscountErrorExtension on DiscountError {
  DiscountError copyWith({
    dynamic errorCode,
    String? message,
    String? title,
    dynamic extra,
  }) {
    return DiscountError()
      ..errorCode = errorCode ?? this.errorCode
      ..message = message ?? this.message
      ..title = title ?? this.title
      ..extra = extra ?? this.extra;
  }
}

DiscountResults $DiscountResultsFromJson(Map<String, dynamic> json) {
  final DiscountResults discountResults = DiscountResults();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    discountResults.title = title;
  }
  final dynamic type = json['type'];
  if (type != null) {
    discountResults.type = type;
  }
  final dynamic count = json['count'];
  if (count != null) {
    discountResults.count = count;
  }
  final List<DiscountResultsCampaigns>? campaigns = (json['campaigns'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<DiscountResultsCampaigns>(
          e) as DiscountResultsCampaigns).toList();
  if (campaigns != null) {
    discountResults.campaigns = campaigns;
  }
  return discountResults;
}

Map<String, dynamic> $DiscountResultsToJson(DiscountResults entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['count'] = entity.count;
  data['campaigns'] = entity.campaigns.map((v) => v.toJson()).toList();
  return data;
}

extension DiscountResultsExtension on DiscountResults {
  DiscountResults copyWith({
    String? title,
    dynamic type,
    dynamic count,
    List<DiscountResultsCampaigns>? campaigns,
  }) {
    return DiscountResults()
      ..title = title ?? this.title
      ..type = type ?? this.type
      ..count = count ?? this.count
      ..campaigns = campaigns ?? this.campaigns;
  }
}

DiscountResultsCampaigns $DiscountResultsCampaignsFromJson(
    Map<String, dynamic> json) {
  final DiscountResultsCampaigns discountResultsCampaigns = DiscountResultsCampaigns();
  final String? brand = jsonConvert.convert<String>(json['brand']);
  if (brand != null) {
    discountResultsCampaigns.brand = brand;
  }
  final dynamic couponCount = json['coupon_count'];
  if (couponCount != null) {
    discountResultsCampaigns.couponCount = couponCount;
  }
  final List<
      DiscountResultsCampaignsCoupons>? coupons = (json['coupons'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<DiscountResultsCampaignsCoupons>(
          e) as DiscountResultsCampaignsCoupons).toList();
  if (coupons != null) {
    discountResultsCampaigns.coupons = coupons;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    discountResultsCampaigns.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    discountResultsCampaigns.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    discountResultsCampaigns.description = description;
  }
  final int? endTime = jsonConvert.convert<int>(json['end_time']);
  if (endTime != null) {
    discountResultsCampaigns.endTime = endTime;
  }
  final String? timeLeft = jsonConvert.convert<String>(json['time_left']);
  if (timeLeft != null) {
    discountResultsCampaigns.timeLeft = timeLeft;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    discountResultsCampaigns.image = image;
  }
  final dynamic discountRate = json['discount_rate'];
  if (discountRate != null) {
    discountResultsCampaigns.discountRate = discountRate;
  }
  final bool? allowOrder = jsonConvert.convert<bool>(json['allow_order']);
  if (allowOrder != null) {
    discountResultsCampaigns.allowOrder = allowOrder;
  }
  final bool? showAllCoupons = jsonConvert.convert<bool>(
      json['show_all_coupons']);
  if (showAllCoupons != null) {
    discountResultsCampaigns.showAllCoupons = showAllCoupons;
  }
  return discountResultsCampaigns;
}

Map<String, dynamic> $DiscountResultsCampaignsToJson(
    DiscountResultsCampaigns entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['brand'] = entity.brand;
  data['coupon_count'] = entity.couponCount;
  data['coupons'] = entity.coupons.map((v) => v.toJson()).toList();
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['end_time'] = entity.endTime;
  data['time_left'] = entity.timeLeft;
  data['image'] = entity.image;
  data['discount_rate'] = entity.discountRate;
  data['allow_order'] = entity.allowOrder;
  data['show_all_coupons'] = entity.showAllCoupons;
  return data;
}

extension DiscountResultsCampaignsExtension on DiscountResultsCampaigns {
  DiscountResultsCampaigns copyWith({
    String? brand,
    dynamic couponCount,
    List<DiscountResultsCampaignsCoupons>? coupons,
    String? id,
    String? title,
    String? description,
    int? endTime,
    String? timeLeft,
    String? image,
    dynamic discountRate,
    bool? allowOrder,
    bool? showAllCoupons,
  }) {
    return DiscountResultsCampaigns()
      ..brand = brand ?? this.brand
      ..couponCount = couponCount ?? this.couponCount
      ..coupons = coupons ?? this.coupons
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..endTime = endTime ?? this.endTime
      ..timeLeft = timeLeft ?? this.timeLeft
      ..image = image ?? this.image
      ..discountRate = discountRate ?? this.discountRate
      ..allowOrder = allowOrder ?? this.allowOrder
      ..showAllCoupons = showAllCoupons ?? this.showAllCoupons;
  }
}

DiscountResultsCampaignsCoupons $DiscountResultsCampaignsCouponsFromJson(
    Map<String, dynamic> json) {
  final DiscountResultsCampaignsCoupons discountResultsCampaignsCoupons = DiscountResultsCampaignsCoupons();
  final String? barcode = jsonConvert.convert<String>(json['barcode']);
  if (barcode != null) {
    discountResultsCampaignsCoupons.barcode = barcode;
  }
  final dynamic quantity = json['quantity'];
  if (quantity != null) {
    discountResultsCampaignsCoupons.quantity = quantity;
  }
  final dynamic effectiveFrom = json['effective_from'];
  if (effectiveFrom != null) {
    discountResultsCampaignsCoupons.effectiveFrom = effectiveFrom;
  }
  final dynamic effectiveTo = json['effective_to'];
  if (effectiveTo != null) {
    discountResultsCampaignsCoupons.effectiveTo = effectiveTo;
  }
  final int? endTime = jsonConvert.convert<int>(json['end_time']);
  if (endTime != null) {
    discountResultsCampaignsCoupons.endTime = endTime;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    discountResultsCampaignsCoupons.image = image;
  }
  return discountResultsCampaignsCoupons;
}

Map<String, dynamic> $DiscountResultsCampaignsCouponsToJson(
    DiscountResultsCampaignsCoupons entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['barcode'] = entity.barcode;
  data['quantity'] = entity.quantity;
  data['effective_from'] = entity.effectiveFrom;
  data['effective_to'] = entity.effectiveTo;
  data['end_time'] = entity.endTime;
  data['image'] = entity.image;
  return data;
}

extension DiscountResultsCampaignsCouponsExtension on DiscountResultsCampaignsCoupons {
  DiscountResultsCampaignsCoupons copyWith({
    String? barcode,
    dynamic quantity,
    dynamic effectiveFrom,
    dynamic effectiveTo,
    int? endTime,
    String? image,
  }) {
    return DiscountResultsCampaignsCoupons()
      ..barcode = barcode ?? this.barcode
      ..quantity = quantity ?? this.quantity
      ..effectiveFrom = effectiveFrom ?? this.effectiveFrom
      ..effectiveTo = effectiveTo ?? this.effectiveTo
      ..endTime = endTime ?? this.endTime
      ..image = image ?? this.image;
  }
}