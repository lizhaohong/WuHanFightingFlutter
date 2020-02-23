import 'package:dio/dio.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/config/api.dart';
import 'package:wu_han_fighting_flutter/config/config.dart';

///请求序号
int _request_id = 0;

enum RequestType {
  GET,
  POST
}

class RequestModel {
  String url() => "";

  Map params() => {};

  static Dio _client;

  Future get() {
    return _request(url(), type: RequestType.GET, params: params());
  }

  Future post() {
    return _request(url(), type: RequestType.POST, params: params());
  }

  Future postUpload(ProgressCallback callback, FormData data) {
    return _request(url(), type: RequestType.POST, formData: data, progressCallback: callback);
  }

  Future _request(String url,{RequestType type, Map params, FormData formData, ProgressCallback progressCallback}) async {
    final httpUrl = API.reqUrl + url;

    if (_client == null) {
      BaseOptions options = BaseOptions();

      options.connectTimeout = connectTimeout;
      options.receiveTimeout = receiveTimeout;
      options.headers = {"Content-Type" : "application/json"};
      options.baseUrl = API.reqUrl;
      _client = Dio(options);
    }

    _request_id ++;

    int statusCode;
    String statusMessage;

    try {
      Response response;

      if(type == RequestType.GET) {
        if(mapNoEmpty(params)) {
          response = await _client.get(httpUrl, queryParameters: params);
        } else {
          response = await _client.get(httpUrl);
        }
      } else if(type == RequestType.POST) {
        if(mapNoEmpty(params) || formData.isNotEmpty) {
          response = await _client.post(httpUrl, data: formData ?? params, onSendProgress: progressCallback);
        } else {
          response = await _client.post(httpUrl, onSendProgress: progressCallback);
        }
      }

      statusCode = response.statusCode;

      if(response != null) {
        print("HTTP request_url = ${httpUrl}");
        if(mapNoEmpty(params)) {
          print("HTTP request_params = ${params.toString()}");
        }
        print("HTTP response = "+response.data.toString());

        return response.data;
      }

      if(statusCode != 200) {
        return _handleError(httpUrl, statusCode, statusMessage);
      }
    } catch(e) {
      return _handleError(httpUrl, statusCode, statusMessage, error: e);
    }
  }

  Future _handleError(String url, int statusCode, String statusMessage, {DioError error}) {
    Map errorMap = {
      "statusCode" : statusCode,
      "statusMessage" : statusMessage,
    };

    print("HTTP request error:::url = ${url}, statusCode = ${statusCode}, statusMessage = ${statusMessage}");
    if(error != null) {
      print("HTTP request error = ${error.toString()}");
    }
    return Future.value(errorMap);
  }
}