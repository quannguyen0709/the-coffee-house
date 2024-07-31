import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/rank_infor/rank_infor_entity.dart';

RankInforEntity $RankInforEntityFromJson(Map<String, dynamic> json) {
  final RankInforEntity rankInforEntity = RankInforEntity();
  final dynamic error = json['error'];
  if (error != null) {
    rankInforEntity.error = error;
  }
  final int? lastUpdate = jsonConvert.convert<int>(json['last_update']);
  if (lastUpdate != null) {
    rankInforEntity.lastUpdate = lastUpdate;
  }
  final String? callCenter = jsonConvert.convert<String>(json['call_center']);
  if (callCenter != null) {
    rankInforEntity.callCenter = callCenter;
  }
  final List<RankInforRankInfo>? rankInfo = (json['rank_info'] as List<
      dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<RankInforRankInfo>(e) as RankInforRankInfo)
      .toList();
  if (rankInfo != null) {
    rankInforEntity.rankInfo = rankInfo;
  }
  final RankInforWebLinks? webLinks = jsonConvert.convert<RankInforWebLinks>(
      json['web_links']);
  if (webLinks != null) {
    rankInforEntity.webLinks = webLinks;
  }
  final String? pingDeviceConnected = jsonConvert.convert<String>(
      json['ping_device_connected']);
  if (pingDeviceConnected != null) {
    rankInforEntity.pingDeviceConnected = pingDeviceConnected;
  }
  final bool? updateOptional = jsonConvert.convert<bool>(
      json['update_optional']);
  if (updateOptional != null) {
    rankInforEntity.updateOptional = updateOptional;
  }
  final bool? updateRequired = jsonConvert.convert<bool>(
      json['update_required']);
  if (updateRequired != null) {
    rankInforEntity.updateRequired = updateRequired;
  }
  final int? shippingFreq = jsonConvert.convert<int>(json['shipping_freq']);
  if (shippingFreq != null) {
    rankInforEntity.shippingFreq = shippingFreq;
  }
  final String? authHaravan = jsonConvert.convert<String>(json['auth_haravan']);
  if (authHaravan != null) {
    rankInforEntity.authHaravan = authHaravan;
  }
  final String? stagingHost = jsonConvert.convert<String>(json['staging_host']);
  if (stagingHost != null) {
    rankInforEntity.stagingHost = stagingHost;
  }
  final List<String>? gmsApiKeys = (json['gms_api_keys'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (gmsApiKeys != null) {
    rankInforEntity.gmsApiKeys = gmsApiKeys;
  }
  return rankInforEntity;
}

Map<String, dynamic> $RankInforEntityToJson(RankInforEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error'] = entity.error;
  data['last_update'] = entity.lastUpdate;
  data['call_center'] = entity.callCenter;
  data['rank_info'] = entity.rankInfo.map((v) => v.toJson()).toList();
  data['web_links'] = entity.webLinks.toJson();
  data['ping_device_connected'] = entity.pingDeviceConnected;
  data['update_optional'] = entity.updateOptional;
  data['update_required'] = entity.updateRequired;
  data['shipping_freq'] = entity.shippingFreq;
  data['auth_haravan'] = entity.authHaravan;
  data['staging_host'] = entity.stagingHost;
  data['gms_api_keys'] = entity.gmsApiKeys;
  return data;
}

extension RankInforEntityExtension on RankInforEntity {
  RankInforEntity copyWith({
    dynamic error,
    int? lastUpdate,
    String? callCenter,
    List<RankInforRankInfo>? rankInfo,
    RankInforWebLinks? webLinks,
    String? pingDeviceConnected,
    bool? updateOptional,
    bool? updateRequired,
    int? shippingFreq,
    String? authHaravan,
    String? stagingHost,
    List<String>? gmsApiKeys,
  }) {
    return RankInforEntity()
      ..error = error ?? this.error
      ..lastUpdate = lastUpdate ?? this.lastUpdate
      ..callCenter = callCenter ?? this.callCenter
      ..rankInfo = rankInfo ?? this.rankInfo
      ..webLinks = webLinks ?? this.webLinks
      ..pingDeviceConnected = pingDeviceConnected ?? this.pingDeviceConnected
      ..updateOptional = updateOptional ?? this.updateOptional
      ..updateRequired = updateRequired ?? this.updateRequired
      ..shippingFreq = shippingFreq ?? this.shippingFreq
      ..authHaravan = authHaravan ?? this.authHaravan
      ..stagingHost = stagingHost ?? this.stagingHost
      ..gmsApiKeys = gmsApiKeys ?? this.gmsApiKeys;
  }
}

RankInforRankInfo $RankInforRankInfoFromJson(Map<String, dynamic> json) {
  final RankInforRankInfo rankInforRankInfo = RankInforRankInfo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    rankInforRankInfo.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    rankInforRankInfo.name = name;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    rankInforRankInfo.min = min;
  }
  final int? max = jsonConvert.convert<int>(json['max']);
  if (max != null) {
    rankInforRankInfo.max = max;
  }
  final List<String>? gradients = (json['gradients'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (gradients != null) {
    rankInforRankInfo.gradients = gradients;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    rankInforRankInfo.icon = icon;
  }
  final List<dynamic>? benefits = (json['benefits'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (benefits != null) {
    rankInforRankInfo.benefits = benefits;
  }
  return rankInforRankInfo;
}

Map<String, dynamic> $RankInforRankInfoToJson(RankInforRankInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['min'] = entity.min;
  data['max'] = entity.max;
  data['gradients'] = entity.gradients;
  data['icon'] = entity.icon;
  data['benefits'] = entity.benefits;
  return data;
}

extension RankInforRankInfoExtension on RankInforRankInfo {
  RankInforRankInfo copyWith({
    int? id,
    String? name,
    int? min,
    int? max,
    List<String>? gradients,
    String? icon,
    List<dynamic>? benefits,
  }) {
    return RankInforRankInfo()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..min = min ?? this.min
      ..max = max ?? this.max
      ..gradients = gradients ?? this.gradients
      ..icon = icon ?? this.icon
      ..benefits = benefits ?? this.benefits;
  }
}

RankInforWebLinks $RankInforWebLinksFromJson(Map<String, dynamic> json) {
  final RankInforWebLinks rankInforWebLinks = RankInforWebLinks();
  final String? story = jsonConvert.convert<String>(json['story']);
  if (story != null) {
    rankInforWebLinks.story = story;
  }
  final String? help = jsonConvert.convert<String>(json['help']);
  if (help != null) {
    rankInforWebLinks.help = help;
  }
  final String? pressRelease = jsonConvert.convert<String>(
      json['press_release']);
  if (pressRelease != null) {
    rankInforWebLinks.pressRelease = pressRelease;
  }
  final String? reward = jsonConvert.convert<String>(json['reward']);
  if (reward != null) {
    rankInforWebLinks.reward = reward;
  }
  final String? term = jsonConvert.convert<String>(json['term']);
  if (term != null) {
    rankInforWebLinks.term = term;
  }
  final String? termVNPay = jsonConvert.convert<String>(json['termVNPay']);
  if (termVNPay != null) {
    rankInforWebLinks.termVNPay = termVNPay;
  }
  final dynamic termPrepaid = json['termPrepaid'];
  if (termPrepaid != null) {
    rankInforWebLinks.termPrepaid = termPrepaid;
  }
  final String? invoicingInstruct = jsonConvert.convert<String>(
      json['invoicingInstruct']);
  if (invoicingInstruct != null) {
    rankInforWebLinks.invoicingInstruct = invoicingInstruct;
  }
  return rankInforWebLinks;
}

Map<String, dynamic> $RankInforWebLinksToJson(RankInforWebLinks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['story'] = entity.story;
  data['help'] = entity.help;
  data['press_release'] = entity.pressRelease;
  data['reward'] = entity.reward;
  data['term'] = entity.term;
  data['termVNPay'] = entity.termVNPay;
  data['termPrepaid'] = entity.termPrepaid;
  data['invoicingInstruct'] = entity.invoicingInstruct;
  return data;
}

extension RankInforWebLinksExtension on RankInforWebLinks {
  RankInforWebLinks copyWith({
    String? story,
    String? help,
    String? pressRelease,
    String? reward,
    String? term,
    String? termVNPay,
    dynamic termPrepaid,
    String? invoicingInstruct,
  }) {
    return RankInforWebLinks()
      ..story = story ?? this.story
      ..help = help ?? this.help
      ..pressRelease = pressRelease ?? this.pressRelease
      ..reward = reward ?? this.reward
      ..term = term ?? this.term
      ..termVNPay = termVNPay ?? this.termVNPay
      ..termPrepaid = termPrepaid ?? this.termPrepaid
      ..invoicingInstruct = invoicingInstruct ?? this.invoicingInstruct;
  }
}