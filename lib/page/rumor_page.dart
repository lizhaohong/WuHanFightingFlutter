import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wu_han_fighting_flutter/api/rumor_view_model.dart';
import 'package:wu_han_fighting_flutter/api/statistic_request_model.dart';
import 'package:wu_han_fighting_flutter/api/statistic_view_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/common/screen_util.dart';
import 'package:wu_han_fighting_flutter/widget/loading_widget.dart';
import 'package:wu_han_fighting_flutter/widget/title_widget.dart';

class RumorPage extends StatefulWidget {

  @override
  State createState() => _RumorPageState();
}

class _RumorPageState extends State <RumorPage> {

  List rumorList = List();

  bool isRequest = false;

  RefreshController refreshController = RefreshController();

  StatisticModel statisticModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SmartRefresher(controller: refreshController,onRefresh: onRefresh, child:isRequest ? ListView(
        children: <Widget>[
          TitleWidget(title: "全国统计", subTitle: "giao"),
          Visibility(child: TitleWidget(title: "疫情地图", subTitle: "数据来源：国家及各省市地区卫建委"), visible: statisticModel != null),
          Space(),
          Visibility(child: CachedNetworkImage(imageUrl: statisticModel.imgUrl, width: screenWidth(context)), visible: strNoEmpty(statisticModel?.imgUrl)),
          Visibility(child: Column(
            children: statisticModel.dailyPics.map((imgUrl){
              return CachedNetworkImage(imageUrl: imgUrl, width: screenWidth(context));
            }).toList(),
          ), visible: listNoEmpty(statisticModel?.dailyPics)),
          Space(),
          TitleWidget(title: "诊疗"),
          Space(),
          TitleWidget(title: "辟谣", subTitle: "消息数量: ${rumorList.length}"),
          Space(),
        ],
      ) : LoadingWidget()),
    );
  }

  @override
  void initState() {
    super.initState();

    onRefresh();
  }

  onRefresh() {
    rumorViewModel.getRumorData().then((list){
      setState(() {
        rumorList = list;

        isRequest = true;
      });
    });

    statisticViewModel.getStatisticData().then((data) {
      setState(() {
        statisticModel = data;

        isRequest = true;
      });
    });

    Future.delayed(Duration(seconds: 2), (){
      refreshController.refreshCompleted();
    });
  }
}