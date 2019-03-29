import 'package:json_annotation/json_annotation.dart'; 
  
part 'news_data.g.dart';


@JsonSerializable()
  class NewsData extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'code')
  int code;

  NewsData(this.result,this.code,);

  factory NewsData.fromJson(Map<String, dynamic> srcJson) => _$NewsDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsDataToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'retData')
  RetData retData;

  Result(this.retData,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

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

  @JsonKey(name: 'publishLogo')
  String publishLogo;

  @JsonKey(name: 'publishId')
  int publishId;

  @JsonKey(name: 'anchorName')
  String anchorName;

  @JsonKey(name: 'anchorLogo')
  String anchorLogo;

  @JsonKey(name: 'anchorUid')
  int anchorUid;

  @JsonKey(name: 'anchorYYid')
  int anchorYYid;

  @JsonKey(name: 'topicName')
  String topicName;

  @JsonKey(name: 'topicId')
  int topicId;

  @JsonKey(name: 'readCount')
  int readCount;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'cover')
  List<String> cover;

  @JsonKey(name: 'messageSource')
  String messageSource;

  Data(this.messageId,this.title,this.messageType,this.publishName,this.publishLogo,this.publishId,this.anchorName,this.anchorLogo,this.anchorUid,this.anchorYYid,this.topicName,this.topicId,this.readCount,this.publishTime,this.cover,this.messageSource,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class Extend extends Object {

  @JsonKey(name: 'systemTime')
  int systemTime;

  Extend(this.systemTime,);

  factory Extend.fromJson(Map<String, dynamic> srcJson) => _$ExtendFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExtendToJson(this);

}