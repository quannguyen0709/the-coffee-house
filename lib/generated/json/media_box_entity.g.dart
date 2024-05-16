import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';

import '../../call_api_service/model/media_box/media_box_entity.dart';

MediaBoxEntity $MediaBoxEntityFromJson(Map<String, dynamic> json) {
  final MediaBoxEntity mediaBoxEntity = MediaBoxEntity();
  final dynamic error = json['error'];
  if (error != null) {
    mediaBoxEntity.error = error;
  }
  final List<MediaBoxData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<MediaBoxData>(e) as MediaBoxData).toList();
  if (data != null) {
    mediaBoxEntity.data = data;
  }
  return mediaBoxEntity;
}

Map<String, dynamic> $MediaBoxEntityToJson(MediaBoxEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error'] = entity.error;
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  return data;
}

extension MediaBoxEntityExtension on MediaBoxEntity {
  MediaBoxEntity copyWith({
    dynamic error,
    List<MediaBoxData>? data,
  }) {
    return MediaBoxEntity()
      ..error = error ?? this.error
      ..data = data ?? this.data;
  }
}

MediaBoxData $MediaBoxDataFromJson(Map<String, dynamic> json) {
  final MediaBoxData mediaBoxData = MediaBoxData();
  final dynamic id = json['id'];
  if (id != null) {
    mediaBoxData.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    mediaBoxData.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    mediaBoxData.description = description;
  }
  final String? deeplink = jsonConvert.convert<String>(json['deeplink']);
  if (deeplink != null) {
    mediaBoxData.deeplink = deeplink;
  }
  final String? deeplinkWeb = jsonConvert.convert<String>(json['deeplink_web']);
  if (deeplinkWeb != null) {
    mediaBoxData.deeplinkWeb = deeplinkWeb;
  }
  final int? priorityWeb = jsonConvert.convert<int>(json['priority_web']);
  if (priorityWeb != null) {
    mediaBoxData.priorityWeb = priorityWeb;
  }
  final bool? visibleWeb = jsonConvert.convert<bool>(json['visible_web']);
  if (visibleWeb != null) {
    mediaBoxData.visibleWeb = visibleWeb;
  }
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    mediaBoxData.time = time;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    mediaBoxData.icon = icon;
    mediaBoxData.iconRespone = icon;
  }
  final String? iconWeb = jsonConvert.convert<String>(json['icon_web']);
  if (iconWeb != null) {
    mediaBoxData.iconWeb = iconWeb;
    mediaBoxData.iconRespone = iconWeb;
  }
  final bool? read = jsonConvert.convert<bool>(json['read']);
  if (read != null) {
    mediaBoxData.read = read;
  }
  final dynamic popup = json['popup'];
  if (popup != null) {
    mediaBoxData.popup = popup;
  }
  final dynamic mariaActionId = json['maria_action_id'];
  if (mariaActionId != null) {
    mediaBoxData.mariaActionId = mariaActionId;
  }
  return mediaBoxData;
}

Map<String, dynamic> $MediaBoxDataToJson(MediaBoxData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['deeplink'] = entity.deeplink;
  data['deeplink_web'] = entity.deeplinkWeb;
  data['priority_web'] = entity.priorityWeb;
  data['visible_web'] = entity.visibleWeb;
  data['time'] = entity.time;
  data['icon'] = entity.icon;
  data['icon_web'] = entity.iconWeb;
  data['read'] = entity.read;
  data['popup'] = entity.popup;
  data['maria_action_id'] = entity.mariaActionId;
  return data;
}

extension MediaBoxDataExtension on MediaBoxData {
  MediaBoxData copyWith({
    dynamic id,
    String? title,
    String? description,
    String? deeplink,
    String? deeplinkWeb,
    int? priorityWeb,
    bool? visibleWeb,
    int? time,
    String? icon,
    String? iconWeb,
    bool? read,
    dynamic popup,
    dynamic mariaActionId,
  }) {
    return MediaBoxData()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..deeplink = deeplink ?? this.deeplink
      ..deeplinkWeb = deeplinkWeb ?? this.deeplinkWeb
      ..priorityWeb = priorityWeb ?? this.priorityWeb
      ..visibleWeb = visibleWeb ?? this.visibleWeb
      ..time = time ?? this.time
      ..icon = icon ?? this.icon
      ..iconWeb = iconWeb ?? this.iconWeb
      ..read = read ?? this.read
      ..popup = popup ?? this.popup
      ..mariaActionId = mariaActionId ?? this.mariaActionId;
  }
}