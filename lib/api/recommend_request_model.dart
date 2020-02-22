import 'package:wu_han_fighting_flutter/config/api.dart';
import 'package:wu_han_fighting_flutter/http/request_model.dart';
import 'dart:convert' show json;

class RecommendRequestModel extends RequestModel {

  @override
  String url() => API.getIndexRecommendList;

  data() => get();
}

class RecommendModel {
  int id;
  int createTime;
  int modifyTime;
  int contentType;
  String title;
  String imgUrl;
  String linkUrl;
  int recordStatus;
  int sort;
  String operator;

  RecommendModel({
    this.id,
    this.createTime,
    this.modifyTime,
    this.contentType,
    this.title,
    this.imgUrl,
    this.linkUrl,
    this.recordStatus,
    this.sort,
    this.operator,
  });

  static RecommendModel fromJson(jsonRes)=>jsonRes == null? null:RecommendModel(
    id : jsonRes['id'],
    createTime : jsonRes['createTime'],
    modifyTime : jsonRes['modifyTime'],
    contentType : jsonRes['contentType'],
    title : jsonRes['title'],
    imgUrl : jsonRes['imgUrl'],
    linkUrl : jsonRes['linkUrl'],
    recordStatus : jsonRes['recordStatus'],
    sort : jsonRes['sort'],
    operator : jsonRes['operator'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'createTime': createTime,
    'modifyTime': modifyTime,
    'contentType': contentType,
    'title': title,
    'imgUrl': imgUrl,
    'linkUrl': linkUrl,
    'recordStatus': recordStatus,
    'sort': sort,
    'operator': operator,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}