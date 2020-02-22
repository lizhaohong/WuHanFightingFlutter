import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wu_han_fighting_flutter/api/city_view_model.dart';
import 'package:wu_han_fighting_flutter/api/recommend_view_model.dart';
import 'package:wu_han_fighting_flutter/widget/loading_widget.dart';
import 'package:wu_han_fighting_flutter/widget/recommend_widget.dart';
import 'package:wu_han_fighting_flutter/widget/stretching_list_widget.dart';
import 'package:wu_han_fighting_flutter/widget/title_widget.dart';

class ProtectPage extends StatefulWidget {

  @override
  State createState() => _ProtectPageState();
}

class _ProtectPageState extends State <ProtectPage> {

  List provinceData = List();

  List recommendData = List();

  bool isRequest = false;

  RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SmartRefresher(controller: refreshController, onRefresh: onRefresh, child: ListView(shrinkWrap: true,children: <Widget>[
        TitleWidget(title: "地区统计"),
        isRequest ? (provinceData.length > 0 ? StretchingListWidget(provinces:provinceData) : Text("暂无数据")) : LoadingWidget(),
        TitleWidget(title: "防护知识"),
        isRequest ? (recommendData.length > 0 ? Column(children:recommendData.map((model){
          return RecommendWidget(model: model);
        }).toList()) : Text("暂无数据")) : LoadingWidget()
      ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    onRefresh();
  }

  onRefresh(){
    Future.delayed(Duration(seconds: 2), (){
      refreshController.refreshCompleted();
    });

    recommendViewModel.getRecommendList().then((data) {
      setState(() {
        recommendData = data;

        isRequest = true;
      });
    });

    cityViewModel.getProvinceData().then((data) {
      setState(() {
        provinceData = data;

        isRequest = true;
      });
    });
  }
}