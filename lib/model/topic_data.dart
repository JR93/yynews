import 'package:json_annotation/json_annotation.dart'; 
  
part 'topic_data.g.dart';


@JsonSerializable()
  class TopicData extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'code')
  int code;

  TopicData(this.result,this.code,);

  factory TopicData.fromJson(Map<String, dynamic> srcJson) => _$TopicDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopicDataToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'activity')
  Activity activity;

  @JsonKey(name: 'retData')
  RetData retData;

  Result(this.activity,this.retData,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class Activity extends Object {

  Activity();

  factory Activity.fromJson(Map<String, dynamic> srcJson) => _$ActivityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);

}

  
@JsonSerializable()
  class RetData extends Object {

  @JsonKey(name: 'totalCount')
  int totalCount;

  @JsonKey(name: 'totalPage')
  int totalPage;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'extend')
  Extend extend;

  RetData(this.totalCount,this.totalPage,this.data,this.extend,);

  factory RetData.fromJson(Map<String, dynamic> srcJson) => _$RetDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RetDataToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'messageId')
  int messageId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'messageType')
  int messageType;

  @JsonKey(name: 'publishName')
  String publishName;

  @JsonKey(name: 'readCount')
  int readCount;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'cover')
  List<String> cover;

  @JsonKey(name: 'messageSource')
  String messageSource;

  Data(this.messageId,this.title,this.messageType,this.publishName,this.readCount,this.publishTime,this.cover,this.messageSource,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class Extend extends Object {

  @JsonKey(name: 'systemTime')
  int systemTime;

  @JsonKey(name: 'topicName')
  String topicName;

  Extend(this.systemTime,this.topicName,);

  factory Extend.fromJson(Map<String, dynamic> srcJson) => _$ExtendFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExtendToJson(this);

}