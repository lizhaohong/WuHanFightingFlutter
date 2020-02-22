import 'package:wu_han_fighting_flutter/config/api.dart';
import 'package:wu_han_fighting_flutter/http/request_model.dart';
import 'dart:convert' show json;

class TimeNewRequestModel extends RequestModel {

  @override
  String url() => API.timelineService;

  @override
  Map params() => {};

  Future data() => get();
}

class TimeNewModel {
  int adoptType;
  int createTime;
  String dataInfoOperator;
  int dataInfoState;
  int dataInfoTime;
  int entryWay;
  int id;
  String infoSource;
  int infoType;
  int modifyTime;
  String provinceId;
  int pubDate;
  String pubDateStr;
  String sourceUrl;
  String summary;
  String title;

  TimeNewModel({
    this.adoptType,
    this.createTime,
    this.dataInfoOperator,
    this.dataInfoState,
    this.dataInfoTime,
    this.entryWay,
    this.id,
    this.infoSource,
    this.infoType,
    this.modifyTime,
    this.provinceId,
    this.pubDate,
    this.pubDateStr,
    this.sourceUrl,
    this.summary,
    this.title,
  });

  static TimeNewModel fromJson(jsonRes)=>jsonRes == null? null:TimeNewModel(
    adoptType : jsonRes['adoptType'],
    createTime : jsonRes['createTime'],
    dataInfoOperator : jsonRes['dataInfoOperator'],
    dataInfoState : jsonRes['dataInfoState'],
    dataInfoTime : jsonRes['dataInfoTime'],
    entryWay : jsonRes['entryWay'],
    id : jsonRes['id'],
    infoSource : jsonRes['infoSource'],
    infoType : jsonRes['infoType'],
    modifyTime : jsonRes['modifyTime'],
    provinceId : jsonRes['provinceId'],
    pubDate : jsonRes['pubDate'],
    pubDateStr : jsonRes['pubDateStr'],
    sourceUrl : jsonRes['sourceUrl'],
    summary : jsonRes['summary'],
    title : jsonRes['title'],);

  Map<String, dynamic> toJson() => {
    'adoptType': adoptType,
    'createTime': createTime,
    'dataInfoOperator': dataInfoOperator,
    'dataInfoState': dataInfoState,
    'dataInfoTime': dataInfoTime,
    'entryWay': entryWay,
    'id': id,
    'infoSource': infoSource,
    'infoType': infoType,
    'modifyTime': modifyTime,
    'provinceId': provinceId,
    'pubDate': pubDate,
    'pubDateStr': pubDateStr,
    'sourceUrl': sourceUrl,
    'summary': summary,
    'title': title,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}