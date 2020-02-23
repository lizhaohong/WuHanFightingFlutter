import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wu_han_fighting_flutter/api/time_new_request_model.dart';
import 'package:wu_han_fighting_flutter/api/time_new_view_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/widget/card/time_new_card.dart';
import 'package:wu_han_fighting_flutter/widget/loading_widget.dart';

class HomePage extends StatefulWidget {

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State <HomePage> with AutomaticKeepAliveClientMixin {

  RefreshController refreshController = RefreshController();

  List timeNewModelList = List();

  bool isReq = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(controller: refreshController, child: !isReq ? Center(
        child: LoadingWidget(),
      ) : (listNoEmpty(timeNewModelList) ? ListView.builder(itemBuilder: (BuildContext context, int index){
        TimeNewModel model = timeNewModelList[index];

        return TimeNewCardWidget(model: model, isNew: index == 0,);
      }, itemCount: timeNewModelList.length) : Center(child: Text("暂无数据"))), onRefresh: _refreshData),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    getData();
  }

  _refreshData() {
    getData();
  }

  Future getData() async {
    Future.delayed(Duration(seconds: 2), (){
      refreshController.refreshCompleted();
    });

    await timeNewViewModel.getTimeNews().then((list){
      setState(() {
        timeNewModelList = list;

        isReq = true;
      });
    });
  }
}