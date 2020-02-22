import 'package:flutter/cupertino.dart';

/// 手机号正则表达式->true匹配
bool isMobilePhoneNumber(String value) {
  RegExp mobile = new RegExp(r"(0|86|17951)?(1[0-9][0-9])[0-9]{8}");

  return mobile.hasMatch(value);
}

///验证网页URl
bool isUrl(String value) {
  RegExp url = new RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");

  return url.hasMatch(value);
}

///校验身份证
bool isIdCard(String value) {
  RegExp identity = new RegExp(r"\d{17}[\d|x]|\d{15}");

  return identity.hasMatch(value);
}

///正浮点数
bool isMoney(String value) {
  RegExp identity = new RegExp(
      r"^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$");
  return identity.hasMatch(value);
}

///校验中文
bool isChinese(String value) {
  RegExp identity = new RegExp(r"[\u4e00-\u9fa5]");

  return identity.hasMatch(value);
}

///校验支付宝名称
bool isAliPayName(String value) {
  RegExp identity = new RegExp(r"[\u4e00-\u9fa5_a-zA-Z]");

  return identity.hasMatch(value);
}

bool strNoEmpty(String value) {
  if (value == null) {
    return false;
  }

  return value.trim().isNotEmpty;
}

bool mapNoEmpty(Map map) {
  if(map == null) return false;
  return map.isNotEmpty;
}

bool listNoEmpty(List list) {
  if(list == null) return false;

  if(list.length == 0) return false;

  return true;
}

bool isNetworkImg(String img) {
  return img.startsWith("http") || img.startsWith("https");
}

bool isAssetsImg(String img) {
  return img.startsWith("asset") || img.startsWith("assets");
}

double getMemoryImageCacheSize() {
  return PaintingBinding.instance.imageCache.maximumSize / 1000;
}

void clearMemoryImageCache() {
  PaintingBinding.instance.imageCache.clear();
}

String stringAsFixed(value, num) {
  double v = double.parse(value.toString());

  String str = ((v * 100).floor()).toStringAsFixed(num);

  return str;
}

String hiddenPhone(String phone) {
  String result = '';

  if(phone != null && phone.length >= 11) {
    String start = phone.substring(0, 3);
    String end = phone.substring(8, phone.length - 1);
    result = start + "****" + end;
  }

  return result;
}

String stringDisposeWithDouble(v, {fix = 2}) {
  double b = double.parse(v.toString());

  String vStr = b.toStringAsFixed(fix);

  int length = vStr.length;

  for (int i = 0; i < length; i++) {
    if(vStr.contains('.') && vStr.endsWith('0')) {
      vStr = vStr.substring(0, vStr.length - 1);
    } else {
      break;
    }
  }

  if (vStr.endsWith('.')) {
    vStr = vStr.substring(0, vStr.length - 1);
  }
  return vStr;
}

String removeDot(v) {
  String vStr = v.toString().replaceAll(".", "");

  return vStr;
}

class Space extends StatelessWidget {

  double width;

  double height;

  Space({this.width = 10, this.height = 10});

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height);
  }
}