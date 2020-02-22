import 'package:wu_han_fighting_flutter/config/api.dart';
import 'package:wu_han_fighting_flutter/http/request_model.dart';
import 'dart:convert' show json;

class CityRequestModel extends RequestModel {

  @override
  String url() => API.getAreaStat;

  data() => get();
}

class ProvinceModel {
  String provinceName;
  String provinceShortName;
  int currentConfirmedCount;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;
  String comment;
  int locationId;
  List<Cities> cities;

  ProvinceModel({
    this.provinceName,
    this.provinceShortName,
    this.currentConfirmedCount,
    this.confirmedCount,
    this.suspectedCount,
    this.curedCount,
    this.deadCount,
    this.comment,
    this.locationId,
    this.cities,
  });

  static ProvinceModel fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Cities> cities = jsonRes['cities'] is List ? []: null;
  if(cities!=null) {
    for (var item in jsonRes['cities']) { if (item != null) { cities.add(Cities.fromJson(item));  }
    }
  }
  return ProvinceModel(
    provinceName : jsonRes['provinceName'],
    provinceShortName : jsonRes['provinceShortName'],
    currentConfirmedCount : jsonRes['currentConfirmedCount'],
    confirmedCount : jsonRes['confirmedCount'],
    suspectedCount : jsonRes['suspectedCount'],
    curedCount : jsonRes['curedCount'],
    deadCount : jsonRes['deadCount'],
    comment : jsonRes['comment'],
    locationId : jsonRes['locationId'],
    cities:cities,);}

  Map<String, dynamic> toJson() => {
    'provinceName': provinceName,
    'provinceShortName': provinceShortName,
    'currentConfirmedCount': currentConfirmedCount,
    'confirmedCount': confirmedCount,
    'suspectedCount': suspectedCount,
    'curedCount': curedCount,
    'deadCount': deadCount,
    'comment': comment,
    'locationId': locationId,
    'cities': cities,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Cities {

  String cityName;
  int currentConfirmedCount;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;
  int locationId;

  Cities({
    this.cityName,
    this.currentConfirmedCount,
    this.confirmedCount,
    this.suspectedCount,
    this.curedCount,
    this.deadCount,
    this.locationId,
  });

  static Cities fromJson(jsonRes)=>jsonRes == null? null:Cities(
    cityName : jsonRes['cityName'],
    currentConfirmedCount : jsonRes['currentConfirmedCount'],
    confirmedCount : jsonRes['confirmedCount'],
    suspectedCount : jsonRes['suspectedCount'],
    curedCount : jsonRes['curedCount'],
    deadCount : jsonRes['deadCount'],
    locationId : jsonRes['locationId'],);

  Map<String, dynamic> toJson() => {
    'cityName': cityName,
    'currentConfirmedCount': currentConfirmedCount,
    'confirmedCount': confirmedCount,
    'suspectedCount': suspectedCount,
    'curedCount': curedCount,
    'deadCount': deadCount,
    'locationId': locationId,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}