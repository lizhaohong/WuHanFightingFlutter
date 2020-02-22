import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:wu_han_fighting_flutter/api/knowledge_request_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/common/screen_util.dart';
import 'package:wu_han_fighting_flutter/page/webView/web_view_page.dart';

class KnowledgeCard extends StatelessWidget {

  KnowledgeModel model;

  KnowledgeCard({@required this.model});

  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: (){
      routePush(WebViewPage(url: (model?.linkUrl) ?? "http://book.flutterj.com/", title: (model?.title) ?? "知识"));
    }, child: Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: <Widget>[
          Visibility(child:
          Container(child:
          ClipRRect(child:
          CachedNetworkImage(
              imageUrl:model.imgUrl,
              width: 100,
              height: 100),
              borderRadius: BorderRadius.all(Radius.circular(5)))
              ,
              margin: EdgeInsets.only(right: 10)
          ),
              visible: strNoEmpty(model.imgUrl)
          ),
          SizedBox(
            width: strNoEmpty(model.imgUrl) ? screenWidth(context) - 165 : screenWidth(context) - 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(model.description, maxLines: 5, overflow: TextOverflow.ellipsis)
              ],
            ),
          )
        ],
      ),
    )
    );
  }
}