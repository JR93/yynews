import 'package:json_annotation/json_annotation.dart'; 
  
part 'tabs.g.dart';


@JsonSerializable()
  class Tabs extends Object {

  @JsonKey(name: 'appId')
  String appId;

  @JsonKey(name: 'sign')
  String sign;

  @JsonKey(name: 'data')
  Data data;

  Tabs(this.appId,this.sign,this.data,);

  factory Tabs.fromJson(Map<String, dynamic> srcJson) => _$TabsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TabsToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'code')
  int code;

  Data(this.result,this.code,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'retData')
  List<RetData> retData;

  Result(this.retData,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class RetData extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'keyWords')
  String keyWords;

  RetData(this.id,this.name,this.keyWords,);

  factory RetData.fromJson(Map<String, dynamic> srcJson) => _$RetDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RetDataToJson(this);

}