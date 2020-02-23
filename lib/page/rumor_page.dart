import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wu_han_fighting_flutter/api/entry_request_model.dart';
import 'package:wu_han_fighting_flutter/api/entry_view_model.dart';
import 'package:wu_han_fighting_flutter/api/rumor_request_model.dart';
import 'package:wu_han_fighting_flutter/api/rumor_view_model.dart';
import 'package:wu_han_fighting_flutter/api/statistic_request_model.dart';
import 'package:wu_han_fighting_flutter/api/statistic_view_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/common/date.dart';
import 'package:wu_han_fighting_flutter/common/screen_util.dart';
import 'package:wu_han_fighting_flutter/config/const.dart';
import 'package:wu_han_fighting_flutter/widget/card/rumor_card.dart';
import 'package:wu_han_fighting_flutter/widget/entry_widget.dart';
import 'package:wu_han_fighting_flutter/widget/loading_widget.dart';
import 'package:wu_han_fighting_flutter/widget/statistic_widget.dart';
import 'package:wu_han_fighting_flutter/widget/title_widget.dart';

class RumorPage extends StatefulWidget {

  @override
  State createState() => _RumorPageState();
}

class _RumorPageState extends State <RumorPage> with AutomaticKeepAliveClientMixin {

  List rumorList = List();

  List entryList = List();

  bool isRequest = false;

  RefreshController refreshController = RefreshController();

  StatisticModel statisticModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SmartRefresher(controller: refreshController,onRefresh: onRefresh, child:isRequest ? ListView(
        children: <Widget>[
          Visibility(child: TitleWidget(title: "全国统计", subTitle: timeHandle(statisticModel.modifyTime)), visible: statisticModel != null),
          Visibility(child: StatisticWidget(statisticModel: statisticModel), visible: statisticModel != null),
          Visibility(child: TitleWidget(title: "疫情地图", subTitle: "数据来源：国家及各省市地区卫建委"), visible: statisticModel != null),
          Space(),
          Visibility(child: CachedNetworkImage(imageUrl: statisticModel?.imgUrl ?? defImg, width: screenWidth(context)), visible: strNoEmpty(statisticModel?.imgUrl)),
          Visibility(child: Column(
            children: listNoEmpty(statisticModel?.dailyPics) ? statisticModel.dailyPics.map((imgUrl){
              return CachedNetworkImage(imageUrl: imgUrl, width: screenWidth(context));
            }).toList() : [],
          ), visible: listNoEmpty(statisticModel?.dailyPics)),
          Space(),
          Visibility(child: TitleWidget(title: "诊疗"), visible: entryList.length > 0),
          Visibility(child: Container(
            child:  Wrap(children: entryList.map((entryModel){
              EntryModel model = entryModel;
              return EntryWidget(entryModel: model);
            }).toList()),
            margin: EdgeInsets.only(left: 10),
          ),visible: entryList.length > 0),
          Space(),
          Visibility(child: TitleWidget(title: "辟谣", subTitle: "消息数量: ${rumorList.length}"), visible: rumorList.length > 0),
          Visibility(child: Column(children: rumorList.map((model){
            RumorModel rumorModel = model;

            return RumorCard(rumorModel: rumorModel);
          }).toList()), visible: rumorList.length > 0),
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

  @override
  bool get wantKeepAlive => true;

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

    entryViewModel.getEntryData().then((data){
      setState(() {
        entryList = data;

        isRequest = true;
      });
    });

    Future.delayed(Duration(seconds: 2), (){
      refreshController.refreshCompleted();
    });
  }
}