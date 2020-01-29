import 'package:json_annotation/json_annotation.dart'; 
  
part 'getweek.g.dart';


@JsonSerializable()
  class getweek extends Object {

  @JsonKey(name: 'interval')
  String interval;

  @JsonKey(name: 'flag')
  int flag;

  getweek(this.interval,this.flag,);

  factory getweek.fromJson(Map<String, dynamic> srcJson) => _$getweekFromJson(srcJson);

  Map<String, dynamic> toJson() => _$getweekToJson(this);

}

  
