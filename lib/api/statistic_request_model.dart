import 'package:wu_han_fighting_flutter/config/api.dart';
import 'package:wu_han_fighting_flutter/http/request_model.dart';
import 'dart:convert' show json;

class StatisticRequestModel extends RequestModel {

  @override
  String url() => API.getStatisticsService;

  data() => get();
}

class StatisticModel {

  int id;
  int createTime;
  int modifyTime;
  String infectSource;
  String passWay;
  String imgUrl;
  String dailyPic;
  List<String> dailyPics;
  String summary;
  bool deleted;
  String countRemark;
  int currentConfirmedCount;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;
  int seriousCount;
  int suspectedIncr;
  int currentConfirmedIncr;
  int confirmedIncr;
  int curedIncr;
  int deadIncr;
  int seriousIncr;
  String virus;
  String remark1;
  String remark2;
  String remark3;
  String remark4;
  String remark5;
  String note1;
  String note2;
  String note3;
  String generalRemark;
  String abroadRemark;
  List<Marquee> marquee;
  List<QuanguoTrendChart> quanguoTrendChart;
  List<HbFeiHbTrendChart> hbFeiHbTrendChart;

  StatisticModel({
    this.id,
    this.createTime,
    this.modifyTime,
    this.infectSource,
    this.passWay,
    this.imgUrl,
    this.dailyPic,
    this.dailyPics,
    this.summary,
    this.deleted,
    this.countRemark,
    this.currentConfirmedCount,
    this.confirmedCount,
    this.suspectedCount,
    this.curedCount,
    this.deadCount,
    this.seriousCount,
    this.suspectedIncr,
    this.currentConfirmedIncr,
    this.confirmedIncr,
    this.curedIncr,
    this.deadIncr,
    this.seriousIncr,
    this.virus,
    this.remark1,
    this.remark2,
    this.remark3,
    this.remark4,
    this.remark5,
    this.note1,
    this.note2,
    this.note3,
    this.generalRemark,
    this.abroadRemark,
    this.marquee,
    this.quanguoTrendChart,
    this.hbFeiHbTrendChart,
  });

  static StatisticModel fromJson(jsonRes){ if(jsonRes == null) return null;


  List<String> dailyPics = jsonRes['dailyPics'] is List ? []: null;
  if(dailyPics!=null) {
    for (var item in jsonRes['dailyPics']) { if (item != null) { dailyPics.add(item);  }
    }
  }


  List<Marquee> marquee = jsonRes['marquee'] is List ? []: null;
  if(marquee!=null) {
    for (var item in jsonRes['marquee']) { if (item != null) { marquee.add(Marquee.fromJson(item));  }
    }
  }


  List<QuanguoTrendChart> quanguoTrendChart = jsonRes['quanguoTrendChart'] is List ? []: null;
  if(quanguoTrendChart!=null) {
    for (var item in jsonRes['quanguoTrendChart']) { if (item != null) { quanguoTrendChart.add(QuanguoTrendChart.fromJson(item));  }
    }
  }


  List<HbFeiHbTrendChart> hbFeiHbTrendChart = jsonRes['hbFeiHbTrendChart'] is List ? []: null;
  if(hbFeiHbTrendChart!=null) {
    for (var item in jsonRes['hbFeiHbTrendChart']) { if (item != null) { hbFeiHbTrendChart.add(HbFeiHbTrendChart.fromJson(item));  }
    }
  }
  return StatisticModel(
    id : jsonRes['id'],
    createTime : jsonRes['createTime'],
    modifyTime : jsonRes['modifyTime'],
    infectSource : jsonRes['infectSource'],
    passWay : jsonRes['passWay'],
    imgUrl : jsonRes['imgUrl'],
    dailyPic : jsonRes['dailyPic'],
    dailyPics:dailyPics,
    summary : jsonRes['summary'],
    deleted : jsonRes['deleted'],
    countRemark : jsonRes['countRemark'],
    currentConfirmedCount : jsonRes['currentConfirmedCount'],
    confirmedCount : jsonRes['confirmedCount'],
    suspectedCount : jsonRes['suspectedCount'],
    curedCount : jsonRes['curedCount'],
    deadCount : jsonRes['deadCount'],
    seriousCount : jsonRes['seriousCount'],
    suspectedIncr : jsonRes['suspectedIncr'],
    currentConfirmedIncr : jsonRes['currentConfirmedIncr'],
    confirmedIncr : jsonRes['confirmedIncr'],
    curedIncr : jsonRes['curedIncr'],
    deadIncr : jsonRes['deadIncr'],
    seriousIncr : jsonRes['seriousIncr'],
    virus : jsonRes['virus'],
    remark1 : jsonRes['remark1'],
    remark2 : jsonRes['remark2'],
    remark3 : jsonRes['remark3'],
    remark4 : jsonRes['remark4'],
    remark5 : jsonRes['remark5'],
    note1 : jsonRes['note1'],
    note2 : jsonRes['note2'],
    note3 : jsonRes['note3'],
    generalRemark : jsonRes['generalRemark'],
    abroadRemark : jsonRes['abroadRemark'],
    marquee:marquee,
    quanguoTrendChart:quanguoTrendChart,
    hbFeiHbTrendChart:hbFeiHbTrendChart,);}

  Map<String, dynamic> toJson() => {
    'id': id,
    'createTime': createTime,
    'modifyTime': modifyTime,
    'infectSource': infectSource,
    'passWay': passWay,
    'imgUrl': imgUrl,
    'dailyPic': dailyPic,
    'dailyPics': dailyPics,
    'summary': summary,
    'deleted': deleted,
    'countRemark': countRemark,
    'currentConfirmedCount': currentConfirmedCount,
    'confirmedCount': confirmedCount,
    'suspectedCount': suspectedCount,
    'curedCount': curedCount,
    'deadCount': deadCount,
    'seriousCount': seriousCount,
    'suspectedIncr': suspectedIncr,
    'currentConfirmedIncr': currentConfirmedIncr,
    'confirmedIncr': confirmedIncr,
    'curedIncr': curedIncr,
    'deadIncr': deadIncr,
    'seriousIncr': seriousIncr,
    'virus': virus,
    'remark1': remark1,
    'remark2': remark2,
    'remark3': remark3,
    'remark4': remark4,
    'remark5': remark5,
    'note1': note1,
    'note2': note2,
    'note3': note3,
    'generalRemark': generalRemark,
    'abroadRemark': abroadRemark,
    'marquee': marquee,
    'quanguoTrendChart': quanguoTrendChart,
    'hbFeiHbTrendChart': hbFeiHbTrendChart,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Marquee {

  int id;
  String marqueeLabel;
  String marqueeContent;
  String marqueeLink;

  Marquee({
    this.id,
    this.marqueeLabel,
    this.marqueeContent,
    this.marqueeLink,
  });

  static Marquee fromJson(jsonRes)=>jsonRes == null? null:Marquee(
    id : jsonRes['id'],
    marqueeLabel : jsonRes['marqueeLabel'],
    marqueeContent : jsonRes['marqueeContent'],
    marqueeLink : jsonRes['marqueeLink'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'marqueeLabel': marqueeLabel,
    'marqueeContent': marqueeContent,
    'marqueeLink': marqueeLink,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class QuanguoTrendChart {

  String imgUrl;
  String title;

  QuanguoTrendChart({
    this.imgUrl,
    this.title,
  });

  static QuanguoTrendChart fromJson(jsonRes)=>jsonRes == null? null:QuanguoTrendChart(
    imgUrl : jsonRes['imgUrl'],
    title : jsonRes['title'],);

  Map<String, dynamic> toJson() => {
    'imgUrl': imgUrl,
    'title': title,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class HbFeiHbTrendChart {

  String imgUrl;
  String title;

  HbFeiHbTrendChart({
    this.imgUrl,
    this.title,
  });

  static HbFeiHbTrendChart fromJson(jsonRes)=>jsonRes == null? null:HbFeiHbTrendChart(
    imgUrl : jsonRes['imgUrl'],
    title : jsonRes['title'],);

  Map<String, dynamic> toJson() => {
    'imgUrl': imgUrl,
    'title': title,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}
