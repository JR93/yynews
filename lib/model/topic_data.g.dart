// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicData _$TopicDataFromJson(Map<String, dynamic> json) {
  return TopicData(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['code'] as int);
}

Map<String, dynamic> _$TopicDataToJson(TopicData instance) =>
    <String, dynamic>{'result': instance.result, 'code': instance.code};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['activity'] == null
          ? null
          : Activity.fromJson(json['activity'] as Map<String, dynamic>),
      json['retData'] == null
          ? null
          : RetData.fromJson(json['retData'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'activity': instance.activity,
      'retData': instance.retData
    };

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity();
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{};

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
      'readCount': instance.readCount,
      'publishTime': instance.publishTime,
      'cover': instance.cover,
      'messageSource': instance.messageSource
    };

Extend _$ExtendFromJson(Map<String, dynamic> json) {
  return Extend(json['systemTime'] as int, json['topicName'] as String);
}

Map<String, dynamic> _$ExtendToJson(Extend instance) => <String, dynamic>{
      'systemTime': instance.systemTime,
      'topicName': instance.topicName
    };
