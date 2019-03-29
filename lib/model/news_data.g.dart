// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsData _$NewsDataFromJson(Map<String, dynamic> json) {
  return NewsData(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['code'] as int);
}

Map<String, dynamic> _$NewsDataToJson(NewsData instance) =>
    <String, dynamic>{'result': instance.result, 'code': instance.code};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(json['retData'] == null
      ? null
      : RetData.fromJson(json['retData'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ResultToJson(Result instance) =>
    <String, dynamic>{'retData': instance.retData};

RetData _$RetDataFromJson(Map<String, dynamic> json) {
  return RetData(
      json['totalCount'] as int,
      json['totalPage'] as int,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['extend'] == null
          ? null
          : Extend.fromJson(json['extend'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RetDataToJson(RetData instance) => <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPage': instance.totalPage,
      'data': instance.data,
      'extend': instance.extend
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['messageId'] as int,
      json['title'] as String,
      json['messageType'] as int,
      json['publishName'] as String,
      json['publishLogo'] as String,
      json['publishId'] as int,
      json['anchorName'] as String,
      json['anchorLogo'] as String,
      json['anchorUid'] as int,
      json['anchorYYid'] as int,
      json['topicName'] as String,
      json['topicId'] as int,
      json['readCount'] as int,
      json['publishTime'] as int,
      (json['cover'] as List)?.map((e) => e as String)?.toList(),
      json['messageSource'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'messageId': instance.messageId,
      'title': instance.title,
      'messageType': instance.messageType,
      'publishName': instance.publishName,
      'publishLogo': instance.publishLogo,
      'publishId': instance.publishId,
      'anchorName': instance.anchorName,
      'anchorLogo': instance.anchorLogo,
      'anchorUid': instance.anchorUid,
      'anchorYYid': instance.anchorYYid,
      'topicName': instance.topicName,
      'topicId': instance.topicId,
      'readCount': instance.readCount,
      'publishTime': instance.publishTime,
      'cover': instance.cover,
      'messageSource': instance.messageSource
    };

Extend _$ExtendFromJson(Map<String, dynamic> json) {
  return Extend(json['systemTime'] as int);
}

Map<String, dynamic> _$ExtendToJson(Extend instance) =>
    <String, dynamic>{'systemTime': instance.systemTime};
