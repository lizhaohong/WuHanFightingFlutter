import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:wu_han_fighting_flutter/api/entry_request_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/common/screen_util.dart';
import 'package:wu_han_fighting_flutter/config/const.dart';
import 'package:wu_han_fighting_flutter/page/webView/web_view_page.dart';

class EntryWidget extends StatelessWidget {

  EntryModel entryModel;

  EntryWidget({@required this.entryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 10, top: 10),
        height: 120,
        width: (screenWidth(context) - 41) / 3,
        child: Column(
          children: <Widget>[
            CachedNetworkImage(imageUrl: entryModel?.picUrl ?? defImg),
            Space(height: 5),
            Text(entryModel.configName)
          ],
        ),
      ),
      onTap: (){
        routePush(WebViewPage(url: entryModel?.linkUrl ?? "http://book.flutterj.com/", title: entryModel.configName));
      },
    );
  }
}