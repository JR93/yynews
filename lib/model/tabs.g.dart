// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tabs _$TabsFromJson(Map<String, dynamic> json) {
  return Tabs(
      json['appId'] as String,
      json['sign'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TabsToJson(Tabs instance) => <String, dynamic>{
      'appId': instance.appId,
      'sign': instance.sign,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['code'] as int);
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'result': instance.result, 'code': instance.code};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result((json['retData'] as List)
      ?.map(
          (e) => e == null ? null : RetData.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ResultToJson(Result instance) =>
    <String, dynamic>{'retData': instance.retData};

RetData _$RetDataFromJson(Map<String, dynamic> json) {
  return RetData(
      json['id'] as int, json['name'] as String, json['keyWords'] as String);
}

Map<String, dynamic> _$RetDataToJson(RetData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'keyWords': instance.keyWords
    };
