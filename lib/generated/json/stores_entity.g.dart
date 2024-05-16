import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';

import '../../call_api_service/model/stores/stores_entity.dart';

StoresEntity $StoresEntityFromJson(Map<String, dynamic> json) {
  final StoresEntity storesEntity = StoresEntity();
  final dynamic error = json['error'];
  if (error != null) {
    storesEntity.error = error;
  }
  final List<StoresStores>? stores = (json['stores'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<StoresStores>(e) as StoresStores).toList();
  if (stores != null) {
    storesEntity.stores = stores;
  }
  return storesEntity;
}

Map<String, dynamic> $StoresEntityToJson(StoresEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error'] = entity.error;
  data['stores'] = entity.stores.map((v) => v.toJson()).toList();
  return data;
}

extension StoresEntityExtension on StoresEntity {
  StoresEntity copyWith({
    dynamic error,
    List<StoresStores>? stores,
  }) {
    return StoresEntity()
      ..error = error ?? this.error
      ..stores = stores ?? this.stores;
  }
}

StoresStores $StoresStoresFromJson(Map<String, dynamic> json) {
  final StoresStores storesStores = StoresStores();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    storesStores.id = id;
  }
  final String? puCity = jsonConvert.convert<String>(json['pu_city']);
  if (puCity != null) {
    storesStores.puCity = puCity;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    storesStores.name = name;
  }
  final String? openTime = jsonConvert.convert<String>(json['open_time']);
  if (openTime != null) {
    storesStores.openTime = openTime;
  }
  final List<String>? images = (json['images'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (images != null) {
    storesStores.images = images;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    storesStores.phone = phone;
  }
  final StoresStoresLocation? location = jsonConvert.convert<
      StoresStoresLocation>(json['location']);
  if (location != null) {
    storesStores.location = location;
  }
  final String? fullAddress = jsonConvert.convert<String>(json['full_address']);
  if (fullAddress != null) {
    storesStores.fullAddress = fullAddress;
  }
  final List<String>? serviceTypes = (json['service_types'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (serviceTypes != null) {
    storesStores.serviceTypes = serviceTypes;
  }
  final bool? tableServe = jsonConvert.convert<bool>(json['table_serve']);
  if (tableServe != null) {
    storesStores.tableServe = tableServe;
  }
  final String? textOrderTable = jsonConvert.convert<String>(
      json['text_order_table']);
  if (textOrderTable != null) {
    storesStores.textOrderTable = textOrderTable;
  }
  return storesStores;
}

Map<String, dynamic> $StoresStoresToJson(StoresStores entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['pu_city'] = entity.puCity;
  data['name'] = entity.name;
  data['open_time'] = entity.openTime;
  data['images'] = entity.images;
  data['phone'] = entity.phone;
  data['location'] = entity.location.toJson();
  data['full_address'] = entity.fullAddress;
  data['service_types'] = entity.serviceTypes;
  data['table_serve'] = entity.tableServe;
  data['text_order_table'] = entity.textOrderTable;
  return data;
}

extension StoresStoresExtension on StoresStores {
  StoresStores copyWith({
    int? id,
    String? puCity,
    String? name,
    String? openTime,
    List<String>? images,
    String? phone,
    StoresStoresLocation? location,
    String? fullAddress,
    List<String>? serviceTypes,
    bool? tableServe,
    String? textOrderTable,
  }) {
    return StoresStores()
      ..id = id ?? this.id
      ..puCity = puCity ?? this.puCity
      ..name = name ?? this.name
      ..openTime = openTime ?? this.openTime
      ..images = images ?? this.images
      ..phone = phone ?? this.phone
      ..location = location ?? this.location
      ..fullAddress = fullAddress ?? this.fullAddress
      ..serviceTypes = serviceTypes ?? this.serviceTypes
      ..tableServe = tableServe ?? this.tableServe
      ..textOrderTable = textOrderTable ?? this.textOrderTable;
  }
}

StoresStoresLocation $StoresStoresLocationFromJson(Map<String, dynamic> json) {
  final StoresStoresLocation storesStoresLocation = StoresStoresLocation();
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    storesStoresLocation.lat = lat;
  }
  final double? long = jsonConvert.convert<double>(json['long']);
  if (long != null) {
    storesStoresLocation.long = long;
  }
  return storesStoresLocation;
}

Map<String, dynamic> $StoresStoresLocationToJson(StoresStoresLocation entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['lat'] = entity.lat;
  data['long'] = entity.long;
  return data;
}

extension StoresStoresLocationExtension on StoresStoresLocation {
  StoresStoresLocation copyWith({
    double? lat,
    double? long,
  }) {
    return StoresStoresLocation()
      ..lat = lat ?? this.lat
      ..long = long ?? this.long;
  }
}