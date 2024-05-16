import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';

import '../../call_api_service/model/new_feed/new_feeds_entity.dart';

NewFeedsEntity $NewFeedsEntityFromJson(Map<String, dynamic> json) {
  final NewFeedsEntity newFeedsEntity = NewFeedsEntity();
  final dynamic error = json['error'];
  if (error != null) {
    newFeedsEntity.error = error;
  }
  final List<NewFeedsNews>? news = (json['news'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NewFeedsNews>(e) as NewFeedsNews).toList();
  if (news != null) {
    newFeedsEntity.news = news;
  }
  return newFeedsEntity;
}

Map<String, dynamic> $NewFeedsEntityToJson(NewFeedsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error'] = entity.error;
  data['news'] = entity.news.map((v) => v.toJson()).toList();
  return data;
}

extension NewFeedsEntityExtension on NewFeedsEntity {
  NewFeedsEntity copyWith({
    dynamic error,
    List<NewFeedsNews>? news,
  }) {
    return NewFeedsEntity()
      ..error = error ?? this.error
      ..news = news ?? this.news;
  }
}

NewFeedsNews $NewFeedsNewsFromJson(Map<String, dynamic> json) {
  final NewFeedsNews newFeedsNews = NewFeedsNews();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    newFeedsNews.name = name;
  }
  final List<NewFeedsNewsPosts>? posts = (json['posts'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewFeedsNewsPosts>(e) as NewFeedsNewsPosts)
      .toList();
  if (posts != null) {
    newFeedsNews.posts = posts;
  }
  return newFeedsNews;
}

Map<String, dynamic> $NewFeedsNewsToJson(NewFeedsNews entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['posts'] = entity.posts.map((v) => v.toJson()).toList();
  return data;
}

extension NewFeedsNewsExtension on NewFeedsNews {
  NewFeedsNews copyWith({
    String? name,
    List<NewFeedsNewsPosts>? posts,
  }) {
    return NewFeedsNews()
      ..name = name ?? this.name
      ..posts = posts ?? this.posts;
  }
}

NewFeedsNewsPosts $NewFeedsNewsPostsFromJson(Map<String, dynamic> json) {
  final NewFeedsNewsPosts newFeedsNewsPosts = NewFeedsNewsPosts();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    newFeedsNewsPosts.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    newFeedsNewsPosts.title = title;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    newFeedsNewsPosts.url = url;
  }
  final String? shareUrl = jsonConvert.convert<String>(json['share_url']);
  if (shareUrl != null) {
    newFeedsNewsPosts.shareUrl = shareUrl;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    newFeedsNewsPosts.thumbnail = thumbnail;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    newFeedsNewsPosts.content = content;
  }
  final int? publish = jsonConvert.convert<int>(json['publish']);
  if (publish != null) {
    newFeedsNewsPosts.publish = publish;
  }
  final String? button = jsonConvert.convert<String>(json['button']);
  if (button != null) {
    newFeedsNewsPosts.button = button;
  }
  final String? deeplink = jsonConvert.convert<String>(json['deeplink']);
  if (deeplink != null) {
    newFeedsNewsPosts.deeplink = deeplink;
  }
  final String? html = jsonConvert.convert<String>(json['html']);
  if (html != null) {
    newFeedsNewsPosts.html = html;
  }
  return newFeedsNewsPosts;
}

Map<String, dynamic> $NewFeedsNewsPostsToJson(NewFeedsNewsPosts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['url'] = entity.url;
  data['share_url'] = entity.shareUrl;
  data['thumbnail'] = entity.thumbnail;
  data['content'] = entity.content;
  data['publish'] = entity.publish;
  data['button'] = entity.button;
  data['deeplink'] = entity.deeplink;
  data['html'] = entity.html;
  return data;
}

extension NewFeedsNewsPostsExtension on NewFeedsNewsPosts {
  NewFeedsNewsPosts copyWith({
    String? id,
    String? title,
    String? url,
    String? shareUrl,
    String? thumbnail,
    String? content,
    int? publish,
    String? button,
    String? deeplink,
    String? html,
  }) {
    return NewFeedsNewsPosts()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..url = url ?? this.url
      ..shareUrl = shareUrl ?? this.shareUrl
      ..thumbnail = thumbnail ?? this.thumbnail
      ..content = content ?? this.content
      ..publish = publish ?? this.publish
      ..button = button ?? this.button
      ..deeplink = deeplink ?? this.deeplink
      ..html = html ?? this.html;
  }
}