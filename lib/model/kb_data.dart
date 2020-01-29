import 'package:json_annotation/json_annotation.dart'; 
  
part 'kb_data.g.dart';


@JsonSerializable()
  class KbData extends Object {

  @JsonKey(name: 'information')
  Information information;

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'kb')
  Kb kb;

  KbData(this.information,this.kbFlag,this.kb,);

  factory KbData.fromJson(Map<String, dynamic> srcJson) => _$KbDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KbDataToJson(this);

}

  
@JsonSerializable()
  class Information extends Object {

  @JsonKey(name: 'xy')
  String xy;

  @JsonKey(name: 'zy')
  String zy;

  @JsonKey(name: 'bj')
  String bj;

  @JsonKey(name: 'xm')
  String xm;

  @JsonKey(name: 'xh')
  String xh;

  @JsonKey(name: 'xn')
  String xn;

  @JsonKey(name: 'xq')
  String xq;

  Information(this.xy,this.zy,this.bj,this.xm,this.xh,this.xn,this.xq,);

  factory Information.fromJson(Map<String, dynamic> srcJson) => _$InformationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InformationToJson(this);

}

  
@JsonSerializable()
  class Kb extends Object {

  @JsonKey(name: 'Tues4')
  Tues4 tues4;

  @JsonKey(name: 'Sun4')
  Sun4 sun4;

  @JsonKey(name: 'Mon2')
  Mon2 mon2;

  @JsonKey(name: 'Fri2')
  Fri2 fri2;

  @JsonKey(name: 'Sun3')
  Sun3 sun3;

  @JsonKey(name: 'Sat1')
  Sat1 sat1;

  @JsonKey(name: 'Sat5')
  Sat5 sat5;

  @JsonKey(name: 'Wed5')
  Wed5 wed5;

  @JsonKey(name: 'Fri5')
  Fri5 fri5;

  @JsonKey(name: 'Tues1')
  Tues1 tues1;

  @JsonKey(name: 'Fri1')
  Fri1 fri1;

  @JsonKey(name: 'Wed2')
  Wed2 wed2;

  @JsonKey(name: 'Mon3')
  Mon3 mon3;

  @JsonKey(name: 'Fri4')
  Fri4 fri4;

  @JsonKey(name: 'Sun1')
  Sun1 sun1;

  @JsonKey(name: 'Thur1')
  Thur1 thur1;

  @JsonKey(name: 'Sun5')
  Sun5 sun5;

  @JsonKey(name: 'Thur4')
  Thur4 thur4;

  @JsonKey(name: 'Tues3')
  Tues3 tues3;

  @JsonKey(name: 'Thur5')
  Thur5 thur5;

  @JsonKey(name: 'Tues5')
  Tues5 tues5;

  @JsonKey(name: 'Thur3')
  Thur3 thur3;

  @JsonKey(name: 'Sat3')
  Sat3 sat3;

  @JsonKey(name: 'Wed3')
  Wed3 wed3;

  @JsonKey(name: 'Thur2')
  Thur2 thur2;

  @JsonKey(name: 'Wed1')
  Wed1 wed1;

  @JsonKey(name: 'Fri3')
  Fri3 fri3;

  @JsonKey(name: 'Tues2')
  Tues2 tues2;

  @JsonKey(name: 'Mon4')
  Mon4 mon4;

  @JsonKey(name: 'Sat4')
  Sat4 sat4;

  @JsonKey(name: 'Wed4')
  Wed4 wed4;

  @JsonKey(name: 'Sat2')
  Sat2 sat2;

  @JsonKey(name: 'Mon1')
  Mon1 mon1;

  @JsonKey(name: 'Mon5')
  Mon5 mon5;

  @JsonKey(name: 'Sun2')
  Sun2 sun2;

  Kb(this.tues4,this.sun4,this.mon2,this.fri2,this.sun3,this.sat1,this.sat5,this.wed5,this.fri5,this.tues1,this.fri1,this.wed2,this.mon3,this.fri4,this.sun1,this.thur1,this.sun5,this.thur4,this.tues3,this.thur5,this.tues5,this.thur3,this.sat3,this.wed3,this.thur2,this.wed1,this.fri3,this.tues2,this.mon4,this.sat4,this.wed4,this.sat2,this.mon1,this.mon5,this.sun2,);

  factory Kb.fromJson(Map<String, dynamic> srcJson) => _$KbFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KbToJson(this);

}

  
@JsonSerializable()
  class Tues4 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Tues4(this.kbFlag,this.classCurrent,);

  factory Tues4.fromJson(Map<String, dynamic> srcJson) => _$Tues4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Tues4ToJson(this);

}

  
@JsonSerializable()
  class Class_current extends Object {

  @JsonKey(name: 'end')
  int end;

  @JsonKey(name: 'teacher')
  String teacher;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'course')
  String course;

  @JsonKey(name: 'start')
  int start;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'js_xs')
  int jsXs;

  Class_current(this.end,this.teacher,this.location,this.course,this.start,this.time,this.jsXs,);

  factory Class_current.fromJson(Map<String, dynamic> srcJson) => _$Class_currentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Class_currentToJson(this);

}

  
@JsonSerializable()
  class Sun4 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sun4(this.kbFlag,this.classCurrent,);

  factory Sun4.fromJson(Map<String, dynamic> srcJson) => _$Sun4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sun4ToJson(this);

}

  
@JsonSerializable()
  class Mon2 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Mon2(this.kbFlag,this.classCurrent,);

  factory Mon2.fromJson(Map<String, dynamic> srcJson) => _$Mon2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Mon2ToJson(this);

}

 
@JsonSerializable()
  class Fri2 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Fri2(this.kbFlag,this.classCurrent,);

  factory Fri2.fromJson(Map<String, dynamic> srcJson) => _$Fri2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Fri2ToJson(this);

}

  
@JsonSerializable()
  class Sun3 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sun3(this.kbFlag,this.classCurrent,);

  factory Sun3.fromJson(Map<String, dynamic> srcJson) => _$Sun3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sun3ToJson(this);

}

  
@JsonSerializable()
  class Sat1 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sat1(this.kbFlag,this.classCurrent,);

  factory Sat1.fromJson(Map<String, dynamic> srcJson) => _$Sat1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sat1ToJson(this);

}

  
@JsonSerializable()
  class Sat5 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sat5(this.kbFlag,this.classCurrent,);

  factory Sat5.fromJson(Map<String, dynamic> srcJson) => _$Sat5FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sat5ToJson(this);

}

  
@JsonSerializable()
  class Wed5 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Wed5(this.kbFlag,this.classCurrent,);

  factory Wed5.fromJson(Map<String, dynamic> srcJson) => _$Wed5FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Wed5ToJson(this);

}

  
@JsonSerializable()
  class Fri5 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Fri5(this.kbFlag,this.classCurrent,);

  factory Fri5.fromJson(Map<String, dynamic> srcJson) => _$Fri5FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Fri5ToJson(this);

}

  
@JsonSerializable()
  class Tues1 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Tues1(this.kbFlag,this.classCurrent,);

  factory Tues1.fromJson(Map<String, dynamic> srcJson) => _$Tues1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Tues1ToJson(this);

}

 

  
@JsonSerializable()
  class Fri1 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Fri1(this.kbFlag,this.classCurrent,);

  factory Fri1.fromJson(Map<String, dynamic> srcJson) => _$Fri1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Fri1ToJson(this);

}

  
@JsonSerializable()
  class Wed2 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Wed2(this.kbFlag,this.classCurrent,);

  factory Wed2.fromJson(Map<String, dynamic> srcJson) => _$Wed2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Wed2ToJson(this);

}

   
@JsonSerializable()
  class Mon3 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Mon3(this.kbFlag,this.classCurrent,);

  factory Mon3.fromJson(Map<String, dynamic> srcJson) => _$Mon3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Mon3ToJson(this);

}

 

  
@JsonSerializable()
  class Fri4 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Fri4(this.kbFlag,this.classCurrent,);

  factory Fri4.fromJson(Map<String, dynamic> srcJson) => _$Fri4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Fri4ToJson(this);

}

  
@JsonSerializable()
  class Sun1 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sun1(this.kbFlag,this.classCurrent,);

  factory Sun1.fromJson(Map<String, dynamic> srcJson) => _$Sun1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sun1ToJson(this);

}

  
@JsonSerializable()
  class Thur1 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Thur1(this.kbFlag,this.classCurrent,);

  factory Thur1.fromJson(Map<String, dynamic> srcJson) => _$Thur1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Thur1ToJson(this);

}

  
@JsonSerializable()
  class Sun5 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sun5(this.kbFlag,this.classCurrent,);

  factory Sun5.fromJson(Map<String, dynamic> srcJson) => _$Sun5FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sun5ToJson(this);

}

  
@JsonSerializable()
  class Thur4 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Thur4(this.kbFlag,this.classCurrent,);

  factory Thur4.fromJson(Map<String, dynamic> srcJson) => _$Thur4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Thur4ToJson(this);

}

  
@JsonSerializable()
  class Tues3 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Tues3(this.kbFlag,this.classCurrent,);

  factory Tues3.fromJson(Map<String, dynamic> srcJson) => _$Tues3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Tues3ToJson(this);

}

  
@JsonSerializable()
  class Thur5 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Thur5(this.kbFlag,this.classCurrent,);

  factory Thur5.fromJson(Map<String, dynamic> srcJson) => _$Thur5FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Thur5ToJson(this);

}

  
@JsonSerializable()
  class Tues5 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Tues5(this.kbFlag,this.classCurrent,);

  factory Tues5.fromJson(Map<String, dynamic> srcJson) => _$Tues5FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Tues5ToJson(this);

}

  
@JsonSerializable()
  class Thur3 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Thur3(this.kbFlag,this.classCurrent,);

  factory Thur3.fromJson(Map<String, dynamic> srcJson) => _$Thur3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Thur3ToJson(this);

}

  
@JsonSerializable()
  class Sat3 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sat3(this.kbFlag,this.classCurrent,);

  factory Sat3.fromJson(Map<String, dynamic> srcJson) => _$Sat3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sat3ToJson(this);

}

  
@JsonSerializable()
  class Wed3 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Wed3(this.kbFlag,this.classCurrent,);

  factory Wed3.fromJson(Map<String, dynamic> srcJson) => _$Wed3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Wed3ToJson(this);

}

 
  
@JsonSerializable()
  class Thur2 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Thur2(this.kbFlag,this.classCurrent,);

  factory Thur2.fromJson(Map<String, dynamic> srcJson) => _$Thur2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Thur2ToJson(this);

}

 
  
@JsonSerializable()
  class Wed1 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Wed1(this.kbFlag,this.classCurrent,);

  factory Wed1.fromJson(Map<String, dynamic> srcJson) => _$Wed1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Wed1ToJson(this);

}

  


  
@JsonSerializable()
  class Fri3 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<Class_current> classCurrent;

  Fri3(this.kbFlag,this.classCurrent,);

  factory Fri3.fromJson(Map<String, dynamic> srcJson) => _$Fri3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Fri3ToJson(this);

}



  
@JsonSerializable()
  class Tues2 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Tues2(this.kbFlag,this.classCurrent,);

  factory Tues2.fromJson(Map<String, dynamic> srcJson) => _$Tues2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Tues2ToJson(this);

}

  
@JsonSerializable()
  class Mon4 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Mon4(this.kbFlag,this.classCurrent,);

  factory Mon4.fromJson(Map<String, dynamic> srcJson) => _$Mon4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Mon4ToJson(this);

}

  
@JsonSerializable()
  class Sat4 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sat4(this.kbFlag,this.classCurrent,);

  factory Sat4.fromJson(Map<String, dynamic> srcJson) => _$Sat4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sat4ToJson(this);

}

  
@JsonSerializable()
  class Wed4 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Wed4(this.kbFlag,this.classCurrent,);

  factory Wed4.fromJson(Map<String, dynamic> srcJson) => _$Wed4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Wed4ToJson(this);

}

  
@JsonSerializable()
  class Sat2 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sat2(this.kbFlag,this.classCurrent,);

  factory Sat2.fromJson(Map<String, dynamic> srcJson) => _$Sat2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sat2ToJson(this);

}

  
@JsonSerializable()
  class Mon1 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Mon1(this.kbFlag,this.classCurrent,);

  factory Mon1.fromJson(Map<String, dynamic> srcJson) => _$Mon1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Mon1ToJson(this);

}

  
@JsonSerializable()
  class Mon5 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Mon5(this.kbFlag,this.classCurrent,);

  factory Mon5.fromJson(Map<String, dynamic> srcJson) => _$Mon5FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Mon5ToJson(this);

}

  
@JsonSerializable()
  class Sun2 extends Object {

  @JsonKey(name: 'kb_flag')
  int kbFlag;

  @JsonKey(name: 'class_current')
  List<dynamic> classCurrent;

  Sun2(this.kbFlag,this.classCurrent,);

  factory Sun2.fromJson(Map<String, dynamic> srcJson) => _$Sun2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sun2ToJson(this);

}

  
