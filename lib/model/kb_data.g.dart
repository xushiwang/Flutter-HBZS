// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kb_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KbData _$KbDataFromJson(Map<String, dynamic> json) {
  return KbData(
      json['information'] == null
          ? null
          : Information.fromJson(json['information'] as Map<String, dynamic>),
      json['kb_flag'] as int,
      json['kb'] == null
          ? null
          : Kb.fromJson(json['kb'] as Map<String, dynamic>));
}

Map<String, dynamic> _$KbDataToJson(KbData instance) => <String, dynamic>{
      'information': instance.information,
      'kb_flag': instance.kbFlag,
      'kb': instance.kb
    };

Information _$InformationFromJson(Map<String, dynamic> json) {
  return Information(
      json['xy'] as String,
      json['zy'] as String,
      json['bj'] as String,
      json['xm'] as String,
      json['xh'] as String,
      json['xn'] as String,
      json['xq'] as String);
}

Map<String, dynamic> _$InformationToJson(Information instance) =>
    <String, dynamic>{
      'xy': instance.xy,
      'zy': instance.zy,
      'bj': instance.bj,
      'xm': instance.xm,
      'xh': instance.xh,
      'xn': instance.xn,
      'xq': instance.xq
    };

Kb _$KbFromJson(Map<String, dynamic> json) {
  return Kb(
      json['Tues4'] == null
          ? null
          : Tues4.fromJson(json['Tues4'] as Map<String, dynamic>),
      json['Sun4'] == null
          ? null
          : Sun4.fromJson(json['Sun4'] as Map<String, dynamic>),
      json['Mon2'] == null
          ? null
          : Mon2.fromJson(json['Mon2'] as Map<String, dynamic>),
      json['Fri2'] == null
          ? null
          : Fri2.fromJson(json['Fri2'] as Map<String, dynamic>),
      json['Sun3'] == null
          ? null
          : Sun3.fromJson(json['Sun3'] as Map<String, dynamic>),
      json['Sat1'] == null
          ? null
          : Sat1.fromJson(json['Sat1'] as Map<String, dynamic>),
      json['Sat5'] == null
          ? null
          : Sat5.fromJson(json['Sat5'] as Map<String, dynamic>),
      json['Wed5'] == null
          ? null
          : Wed5.fromJson(json['Wed5'] as Map<String, dynamic>),
      json['Fri5'] == null
          ? null
          : Fri5.fromJson(json['Fri5'] as Map<String, dynamic>),
      json['Tues1'] == null
          ? null
          : Tues1.fromJson(json['Tues1'] as Map<String, dynamic>),
      json['Fri1'] == null
          ? null
          : Fri1.fromJson(json['Fri1'] as Map<String, dynamic>),
      json['Wed2'] == null
          ? null
          : Wed2.fromJson(json['Wed2'] as Map<String, dynamic>),
      json['Mon3'] == null
          ? null
          : Mon3.fromJson(json['Mon3'] as Map<String, dynamic>),
      json['Fri4'] == null
          ? null
          : Fri4.fromJson(json['Fri4'] as Map<String, dynamic>),
      json['Sun1'] == null
          ? null
          : Sun1.fromJson(json['Sun1'] as Map<String, dynamic>),
      json['Thur1'] == null
          ? null
          : Thur1.fromJson(json['Thur1'] as Map<String, dynamic>),
      json['Sun5'] == null
          ? null
          : Sun5.fromJson(json['Sun5'] as Map<String, dynamic>),
      json['Thur4'] == null
          ? null
          : Thur4.fromJson(json['Thur4'] as Map<String, dynamic>),
      json['Tues3'] == null
          ? null
          : Tues3.fromJson(json['Tues3'] as Map<String, dynamic>),
      json['Thur5'] == null
          ? null
          : Thur5.fromJson(json['Thur5'] as Map<String, dynamic>),
      json['Tues5'] == null
          ? null
          : Tues5.fromJson(json['Tues5'] as Map<String, dynamic>),
      json['Thur3'] == null
          ? null
          : Thur3.fromJson(json['Thur3'] as Map<String, dynamic>),
      json['Sat3'] == null
          ? null
          : Sat3.fromJson(json['Sat3'] as Map<String, dynamic>),
      json['Wed3'] == null
          ? null
          : Wed3.fromJson(json['Wed3'] as Map<String, dynamic>),
      json['Thur2'] == null
          ? null
          : Thur2.fromJson(json['Thur2'] as Map<String, dynamic>),
      json['Wed1'] == null
          ? null
          : Wed1.fromJson(json['Wed1'] as Map<String, dynamic>),
      json['Fri3'] == null
          ? null
          : Fri3.fromJson(json['Fri3'] as Map<String, dynamic>),
      json['Tues2'] == null
          ? null
          : Tues2.fromJson(json['Tues2'] as Map<String, dynamic>),
      json['Mon4'] == null
          ? null
          : Mon4.fromJson(json['Mon4'] as Map<String, dynamic>),
      json['Sat4'] == null
          ? null
          : Sat4.fromJson(json['Sat4'] as Map<String, dynamic>),
      json['Wed4'] == null
          ? null
          : Wed4.fromJson(json['Wed4'] as Map<String, dynamic>),
      json['Sat2'] == null
          ? null
          : Sat2.fromJson(json['Sat2'] as Map<String, dynamic>),
      json['Mon1'] == null
          ? null
          : Mon1.fromJson(json['Mon1'] as Map<String, dynamic>),
      json['Mon5'] == null
          ? null
          : Mon5.fromJson(json['Mon5'] as Map<String, dynamic>),
      json['Sun2'] == null
          ? null
          : Sun2.fromJson(json['Sun2'] as Map<String, dynamic>));
}

Map<String, dynamic> _$KbToJson(Kb instance) => <String, dynamic>{
      'Tues4': instance.tues4,
      'Sun4': instance.sun4,
      'Mon2': instance.mon2,
      'Fri2': instance.fri2,
      'Sun3': instance.sun3,
      'Sat1': instance.sat1,
      'Sat5': instance.sat5,
      'Wed5': instance.wed5,
      'Fri5': instance.fri5,
      'Tues1': instance.tues1,
      'Fri1': instance.fri1,
      'Wed2': instance.wed2,
      'Mon3': instance.mon3,
      'Fri4': instance.fri4,
      'Sun1': instance.sun1,
      'Thur1': instance.thur1,
      'Sun5': instance.sun5,
      'Thur4': instance.thur4,
      'Tues3': instance.tues3,
      'Thur5': instance.thur5,
      'Tues5': instance.tues5,
      'Thur3': instance.thur3,
      'Sat3': instance.sat3,
      'Wed3': instance.wed3,
      'Thur2': instance.thur2,
      'Wed1': instance.wed1,
      'Fri3': instance.fri3,
      'Tues2': instance.tues2,
      'Mon4': instance.mon4,
      'Sat4': instance.sat4,
      'Wed4': instance.wed4,
      'Sat2': instance.sat2,
      'Mon1': instance.mon1,
      'Mon5': instance.mon5,
      'Sun2': instance.sun2
    };

Tues4 _$Tues4FromJson(Map<String, dynamic> json) {
  return Tues4(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Tues4ToJson(Tues4 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Class_current _$Class_currentFromJson(Map<String, dynamic> json) {
  return Class_current(
      json['end'] as int,
      json['teacher'] as String,
      json['location'] as String,
      json['course'] as String,
      json['start'] as int,
      json['time'] as String,
      json['js_xs'] as int);
}

Map<String, dynamic> _$Class_currentToJson(Class_current instance) =>
    <String, dynamic>{
      'end': instance.end,
      'teacher': instance.teacher,
      'location': instance.location,
      'course': instance.course,
      'start': instance.start,
      'time': instance.time,
      'js_xs': instance.jsXs
    };

Sun4 _$Sun4FromJson(Map<String, dynamic> json) {
  return Sun4(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sun4ToJson(Sun4 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Mon2 _$Mon2FromJson(Map<String, dynamic> json) {
  return Mon2(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Mon2ToJson(Mon2 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Fri2 _$Fri2FromJson(Map<String, dynamic> json) {
  return Fri2(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Fri2ToJson(Fri2 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Sun3 _$Sun3FromJson(Map<String, dynamic> json) {
  return Sun3(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sun3ToJson(Sun3 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Sat1 _$Sat1FromJson(Map<String, dynamic> json) {
  return Sat1(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sat1ToJson(Sat1 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Sat5 _$Sat5FromJson(Map<String, dynamic> json) {
  return Sat5(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sat5ToJson(Sat5 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Wed5 _$Wed5FromJson(Map<String, dynamic> json) {
  return Wed5(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Wed5ToJson(Wed5 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Fri5 _$Fri5FromJson(Map<String, dynamic> json) {
  return Fri5(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Fri5ToJson(Fri5 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Tues1 _$Tues1FromJson(Map<String, dynamic> json) {
  return Tues1(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Tues1ToJson(Tues1 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Fri1 _$Fri1FromJson(Map<String, dynamic> json) {
  return Fri1(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Fri1ToJson(Fri1 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Wed2 _$Wed2FromJson(Map<String, dynamic> json) {
  return Wed2(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Wed2ToJson(Wed2 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Mon3 _$Mon3FromJson(Map<String, dynamic> json) {
  return Mon3(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Mon3ToJson(Mon3 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Fri4 _$Fri4FromJson(Map<String, dynamic> json) {
  return Fri4(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Fri4ToJson(Fri4 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Sun1 _$Sun1FromJson(Map<String, dynamic> json) {
  return Sun1(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sun1ToJson(Sun1 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Thur1 _$Thur1FromJson(Map<String, dynamic> json) {
  return Thur1(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Thur1ToJson(Thur1 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Sun5 _$Sun5FromJson(Map<String, dynamic> json) {
  return Sun5(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sun5ToJson(Sun5 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Thur4 _$Thur4FromJson(Map<String, dynamic> json) {
  return Thur4(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Thur4ToJson(Thur4 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Tues3 _$Tues3FromJson(Map<String, dynamic> json) {
  return Tues3(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Tues3ToJson(Tues3 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Thur5 _$Thur5FromJson(Map<String, dynamic> json) {
  return Thur5(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Thur5ToJson(Thur5 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Tues5 _$Tues5FromJson(Map<String, dynamic> json) {
  return Tues5(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Tues5ToJson(Tues5 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Thur3 _$Thur3FromJson(Map<String, dynamic> json) {
  return Thur3(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Thur3ToJson(Thur3 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Sat3 _$Sat3FromJson(Map<String, dynamic> json) {
  return Sat3(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sat3ToJson(Sat3 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Wed3 _$Wed3FromJson(Map<String, dynamic> json) {
  return Wed3(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Wed3ToJson(Wed3 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Thur2 _$Thur2FromJson(Map<String, dynamic> json) {
  return Thur2(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Thur2ToJson(Thur2 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Wed1 _$Wed1FromJson(Map<String, dynamic> json) {
  return Wed1(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Wed1ToJson(Wed1 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Fri3 _$Fri3FromJson(Map<String, dynamic> json) {
  return Fri3(
      json['kb_flag'] as int,
      (json['class_current'] as List)
          ?.map((e) => e == null
              ? null
              : Class_current.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$Fri3ToJson(Fri3 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Tues2 _$Tues2FromJson(Map<String, dynamic> json) {
  return Tues2(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Tues2ToJson(Tues2 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Mon4 _$Mon4FromJson(Map<String, dynamic> json) {
  return Mon4(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Mon4ToJson(Mon4 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Sat4 _$Sat4FromJson(Map<String, dynamic> json) {
  return Sat4(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sat4ToJson(Sat4 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Wed4 _$Wed4FromJson(Map<String, dynamic> json) {
  return Wed4(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Wed4ToJson(Wed4 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Sat2 _$Sat2FromJson(Map<String, dynamic> json) {
  return Sat2(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sat2ToJson(Sat2 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Mon1 _$Mon1FromJson(Map<String, dynamic> json) {
  return Mon1(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Mon1ToJson(Mon1 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Mon5 _$Mon5FromJson(Map<String, dynamic> json) {
  return Mon5(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Mon5ToJson(Mon5 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };

Sun2 _$Sun2FromJson(Map<String, dynamic> json) {
  return Sun2(json['kb_flag'] as int, json['class_current'] as List);
}

Map<String, dynamic> _$Sun2ToJson(Sun2 instance) => <String, dynamic>{
      'kb_flag': instance.kbFlag,
      'class_current': instance.classCurrent
    };
