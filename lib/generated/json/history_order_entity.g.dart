import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/history_order/history_order_entity.dart';

HistoryOrderEntity $HistoryOrderEntityFromJson(Map<String, dynamic> json) {
  final HistoryOrderEntity historyOrderEntity = HistoryOrderEntity();
  final dynamic error = json['error'];
  if (error != null) {
    historyOrderEntity.error = error;
  }
  final List<HistoryOrderHistories>? histories = (json['histories'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<HistoryOrderHistories>(e) as HistoryOrderHistories)
      .toList();
  if (histories != null) {
    historyOrderEntity.histories = histories;
  }
  return historyOrderEntity;
}

Map<String, dynamic> $HistoryOrderEntityToJson(HistoryOrderEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error'] = entity.error;
  data['histories'] = entity.histories.map((v) => v.toJson()).toList();
  return data;
}

extension HistoryOrderEntityExtension on HistoryOrderEntity {
  HistoryOrderEntity copyWith({
    dynamic error,
    List<HistoryOrderHistories>? histories,
  }) {
    return HistoryOrderEntity()
      ..error = error ?? this.error
      ..histories = histories ?? this.histories;
  }
}

HistoryOrderHistories $HistoryOrderHistoriesFromJson(
    Map<String, dynamic> json) {
  final HistoryOrderHistories historyOrderHistories = HistoryOrderHistories();
  final String? ref = jsonConvert.convert<String>(json['ref']);
  if (ref != null) {
    historyOrderHistories.ref = ref;
  }
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    historyOrderHistories.time = time;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    historyOrderHistories.total = total;
  }
  final String? totalStr = jsonConvert.convert<String>(json['total_str']);
  if (totalStr != null) {
    historyOrderHistories.totalStr = totalStr;
  }
  final String? orderTypeStr = jsonConvert.convert<String>(
      json['order_type_str']);
  if (orderTypeStr != null) {
    historyOrderHistories.orderTypeStr = orderTypeStr;
  }
  final String? orderType = jsonConvert.convert<String>(json['order_type']);
  if (orderType != null) {
    historyOrderHistories.orderType = orderType;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    historyOrderHistories.type = type;
  }
  final int? bean = jsonConvert.convert<int>(json['bean']);
  if (bean != null) {
    historyOrderHistories.bean = bean;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    historyOrderHistories.image = image;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    historyOrderHistories.thumbnail = thumbnail;
  }
  final dynamic status = json['status'];
  if (status != null) {
    historyOrderHistories.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    historyOrderHistories.message = message;
  }
  final int? storeId = jsonConvert.convert<int>(json['store_id']);
  if (storeId != null) {
    historyOrderHistories.storeId = storeId;
  }
  final String? storeName = jsonConvert.convert<String>(json['store_name']);
  if (storeName != null) {
    historyOrderHistories.storeName = storeName;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    historyOrderHistories.address = address;
  }
  final List<String>? products = (json['products'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (products != null) {
    historyOrderHistories.products = products;
  }
  final HistoryOrderHistoriesRating? rating = jsonConvert.convert<
      HistoryOrderHistoriesRating>(json['rating']);
  if (rating != null) {
    historyOrderHistories.rating = rating;
  }
  return historyOrderHistories;
}

Map<String, dynamic> $HistoryOrderHistoriesToJson(
    HistoryOrderHistories entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ref'] = entity.ref;
  data['time'] = entity.time;
  data['total'] = entity.total;
  data['total_str'] = entity.totalStr;
  data['order_type_str'] = entity.orderTypeStr;
  data['order_type'] = entity.orderType;
  data['type'] = entity.type;
  data['bean'] = entity.bean;
  data['image'] = entity.image;
  data['thumbnail'] = entity.thumbnail;
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['store_id'] = entity.storeId;
  data['store_name'] = entity.storeName;
  data['address'] = entity.address;
  data['products'] = entity.products;
  data['rating'] = entity.rating.toJson();
  return data;
}

extension HistoryOrderHistoriesExtension on HistoryOrderHistories {
  HistoryOrderHistories copyWith({
    String? ref,
    int? time,
    int? total,
    String? totalStr,
    String? orderTypeStr,
    String? orderType,
    String? type,
    int? bean,
    String? image,
    String? thumbnail,
    dynamic status,
    String? message,
    int? storeId,
    String? storeName,
    String? address,
    List<String>? products,
    HistoryOrderHistoriesRating? rating,
  }) {
    return HistoryOrderHistories()
      ..ref = ref ?? this.ref
      ..time = time ?? this.time
      ..total = total ?? this.total
      ..totalStr = totalStr ?? this.totalStr
      ..orderTypeStr = orderTypeStr ?? this.orderTypeStr
      ..orderType = orderType ?? this.orderType
      ..type = type ?? this.type
      ..bean = bean ?? this.bean
      ..image = image ?? this.image
      ..thumbnail = thumbnail ?? this.thumbnail
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..storeId = storeId ?? this.storeId
      ..storeName = storeName ?? this.storeName
      ..address = address ?? this.address
      ..products = products ?? this.products
      ..rating = rating ?? this.rating;
  }
}

HistoryOrderHistoriesRating $HistoryOrderHistoriesRatingFromJson(
    Map<String, dynamic> json) {
  final HistoryOrderHistoriesRating historyOrderHistoriesRating = HistoryOrderHistoriesRating();
  final int? rating = jsonConvert.convert<int>(json['rating']);
  if (rating != null) {
    historyOrderHistoriesRating.rating = rating;
  }
  final List<dynamic>? attention = (json['attention'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (attention != null) {
    historyOrderHistoriesRating.attention = attention;
  }
  final dynamic comment = json['comment'];
  if (comment != null) {
    historyOrderHistoriesRating.comment = comment;
  }
  return historyOrderHistoriesRating;
}

Map<String, dynamic> $HistoryOrderHistoriesRatingToJson(
    HistoryOrderHistoriesRating entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rating'] = entity.rating;
  data['attention'] = entity.attention;
  data['comment'] = entity.comment;
  return data;
}

extension HistoryOrderHistoriesRatingExtension on HistoryOrderHistoriesRating {
  HistoryOrderHistoriesRating copyWith({
    int? rating,
    List<dynamic>? attention,
    dynamic comment,
  }) {
    return HistoryOrderHistoriesRating()
      ..rating = rating ?? this.rating
      ..attention = attention ?? this.attention
      ..comment = comment ?? this.comment;
  }
}