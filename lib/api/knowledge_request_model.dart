import 'package:wu_han_fighting_flutter/config/api.dart';
import 'package:wu_han_fighting_flutter/http/request_model.dart';
import 'dart:convert' show json;

class KnowledgeRequestModel extends RequestModel {

  @override
  String url() => API.getWikiList;

  @override
  Map params() => {};

  Future <dynamic> data() => get();
}

class KnowledgeModel {
  int id;
  String title;
  String imgUrl;
  String linkUrl;
  String description;
  int sort;

  KnowledgeModel({
    this.id,
    this.title,
    this.imgUrl,
    this.linkUrl,
    this.description,
    this.sort,
  });

  static KnowledgeModel fromJson(jsonRes)=>jsonRes == null? null:KnowledgeModel(
    id : jsonRes['id'],
    title : jsonRes['title'],
    imgUrl : jsonRes['imgUrl'],
    linkUrl : jsonRes['linkUrl'],
    description : jsonRes['description'],
    sort : jsonRes['sort'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'imgUrl': imgUrl,
    'linkUrl': linkUrl,
    'description': description,
    'sort': sort,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}