import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/media_box_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/media_box_entity.g.dart';

@JsonSerializable()
class MediaBoxEntity {
	dynamic error;
	late List<MediaBoxData> data;

	MediaBoxEntity();

	factory MediaBoxEntity.fromJson(Map<String, dynamic> json) => $MediaBoxEntityFromJson(json);

	Map<String, dynamic> toJson() => $MediaBoxEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaBoxData {
	dynamic id;
	late String title;
	late String description;
	late String deeplink;
	@JSONField(name: "deeplink_web")
	late String deeplinkWeb;
	@JSONField(name: "priority_web")
	late int priorityWeb;
	@JSONField(name: "visible_web")
	late bool visibleWeb;
	late int time;
	 String icon = '';
	@JSONField(name: "icon_web")
	 String iconWeb = '';
	late bool read;
	dynamic popup;
	@JSONField(name: "maria_action_id")
	dynamic mariaActionId;

	late String iconRespone;

	MediaBoxData();

	factory MediaBoxData.fromJson(Map<String, dynamic> json) => $MediaBoxDataFromJson(json);

	Map<String, dynamic> toJson() => $MediaBoxDataToJson(this);



	@override
	String toString() {
		return jsonEncode(this);
	}
}