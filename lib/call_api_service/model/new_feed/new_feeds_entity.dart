import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/new_feeds_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/new_feeds_entity.g.dart';

@JsonSerializable()
class NewFeedsEntity {
	dynamic error;
	late List<NewFeedsNews> news;

	NewFeedsEntity();

	factory NewFeedsEntity.fromJson(Map<String, dynamic> json) => $NewFeedsEntityFromJson(json);

	Map<String, dynamic> toJson() => $NewFeedsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NewFeedsNews {
	late String name;
	late List<NewFeedsNewsPosts> posts;

	NewFeedsNews();

	factory NewFeedsNews.fromJson(Map<String, dynamic> json) => $NewFeedsNewsFromJson(json);

	Map<String, dynamic> toJson() => $NewFeedsNewsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NewFeedsNewsPosts {
	late String id;
	late String title;
	late String url;
	@JSONField(name: "share_url")
	late String shareUrl;
	late String thumbnail;
	late String content;
	late int publish;
	late String button;
	late String deeplink;
	late String html;

	NewFeedsNewsPosts();

	factory NewFeedsNewsPosts.fromJson(Map<String, dynamic> json) => $NewFeedsNewsPostsFromJson(json);

	Map<String, dynamic> toJson() => $NewFeedsNewsPostsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}