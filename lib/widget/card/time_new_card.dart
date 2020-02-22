import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:nav_router/nav_router.dart';
import 'package:wu_han_fighting_flutter/api/time_new_request_model.dart';
import 'package:wu_han_fighting_flutter/common/screen_util.dart';
import 'package:wu_han_fighting_flutter/page/webView/web_view_page.dart';

class TimeNewCardWidget extends StatelessWidget {

  TimeNewModel model;
  
  bool isNew;

  TimeNewCardWidget({@required this.model, this.isNew = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: FlatButton(
        color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        onPressed: (){
        routePush(WebViewPage(url: (model?.sourceUrl) ?? "http://book.flutterj.com/", title: model?.title ?? "最新动态",));
      }, child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Visibility(child: Container(
                child: Text("最新",
                    style: TextStyle(color: Colors.white)
                ),
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                    borderRadius: BorderRadius.circular(5)
                )
              ), visible: isNew),
              SizedBox(
                width: isNew ? screenWidth(context) - 120 : screenWidth(context) - 70,
                child: Text(model.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                )),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(model.summary,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff999999),
              )
          )),
          Row(
            children: <Widget>[
              Text("时间：${model.pubDateStr}",style: TextStyle(
                fontSize: 12,
                color: Color(0xff999999),
              )),
              Spacer(),
              Text("来源："+model.infoSource,style: TextStyle(
                fontSize: 12,
                color: Color(0xff999999),
              ))
            ],
          )
        ],
      ), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    );
  }
}