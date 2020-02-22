import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:wu_han_fighting_flutter/api/recommend_request_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/common/date.dart';
import 'package:wu_han_fighting_flutter/page/webView/web_view_page.dart';

class RecommendWidget extends StatelessWidget {
  RecommendModel model;

  RecommendWidget({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5))
      ),
      child: FlatButton(onPressed: (){
        routePush(WebViewPage(url: model.linkUrl, title: model.title));
      }, child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
                )),
                Padding(padding: EdgeInsets.only(top: 10), child: Text(timeHandle(model?.createTime ?? 0)))
              ],
            ),
          ),
          Space(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(imageUrl: model.imgUrl, width: 100, height: 100),
          )
        ],
      )),
    );
  }
}