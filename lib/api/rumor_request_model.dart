import 'package:wu_han_fighting_flutter/config/api.dart';
import 'package:wu_han_fighting_flutter/http/request_model.dart';
import 'dart:convert' show json;

class RumorRequestModel extends RequestModel {

  @override
  String url() => API.getIndexRumorList;

  data() => get();
}

class RumorModel {

  int id;
  String title;
  String mainSummary;
  String summary;
  String body;
  String sourceUrl;
  int score;
  int rumorType;

  RumorModel({
    this.id,
    this.title,
    this.mainSummary,
    this.summary,
    this.body,
    this.sourceUrl,
    this.score,
    this.rumorType,
  });

  static RumorModel fromJson(jsonRes)=>jsonRes == null? null:RumorModel(
    id : jsonRes['id'],
    title : jsonRes['title'],
    mainSummary : jsonRes['mainSummary'],
    summary : jsonRes['summary'],
    body : jsonRes['body'],
    sourceUrl : jsonRes['sourceUrl'],
    score : jsonRes['score'],
    rumorType : jsonRes['rumorType'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'mainSummary': mainSummary,
    'summary': summary,
    'body': body,
    'sourceUrl': sourceUrl,
    'score': score,
    'rumorType': rumorType,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}