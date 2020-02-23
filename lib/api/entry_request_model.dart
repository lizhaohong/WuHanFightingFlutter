import 'package:wu_han_fighting_flutter/config/api.dart';
import 'package:wu_han_fighting_flutter/http/request_model.dart';
import 'dart:convert' show json;

class EntryRequestModel extends RequestModel {

  @override
  String url() => API.getEntries;

  data() => get();
}

class EntryModel {
  int id;
  int configNo;
  String configName;
  String linkUrl;
  String imgUrl;
  String picUrl;
  String extLinkUrl;
  String subtitle;
  String clientUrl;

  EntryModel({
    this.id,
    this.configNo,
    this.configName,
    this.linkUrl,
    this.imgUrl,
    this.picUrl,
    this.extLinkUrl,
    this.subtitle,
    this.clientUrl,
  });

  static EntryModel fromJson(jsonRes)=>jsonRes == null? null:EntryModel(
    id : jsonRes['id'],
    configNo : jsonRes['configNo'],
    configName : jsonRes['configName'],
    linkUrl : jsonRes['linkUrl'],
    imgUrl : jsonRes['imgUrl'],
    picUrl : jsonRes['picUrl'],
    extLinkUrl : jsonRes['extLinkUrl'],
    subtitle : jsonRes['subtitle'],
    clientUrl : jsonRes['clientUrl'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'configNo': configNo,
    'configName': configName,
    'linkUrl': linkUrl,
    'imgUrl': imgUrl,
    'picUrl': picUrl,
    'extLinkUrl': extLinkUrl,
    'subtitle': subtitle,
    'clientUrl': clientUrl,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}