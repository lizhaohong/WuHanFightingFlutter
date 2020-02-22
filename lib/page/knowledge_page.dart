import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wu_han_fighting_flutter/api/knowledge_request_model.dart';
import 'package:wu_han_fighting_flutter/api/knowledge_view_model.dart';
import 'package:wu_han_fighting_flutter/widget/card/knowledge_card.dart';
import 'package:wu_han_fighting_flutter/widget/loading_widget.dart';

class KnowledgePage extends StatefulWidget {

  @override
  State createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State <KnowledgePage> with AutomaticKeepAliveClientMixin {

  List knowledgeModelList = List();

  bool isRequest = false;

  RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: refreshController,
        onRefresh: _onRefresh,
        child: isRequest ? ((knowledgeModelList.length > 0) ? ListView.builder(
            itemBuilder: (BuildContext context, int index){
          KnowledgeModel model = knowledgeModelList[index];
      return KnowledgeCard(model: model);
    },itemCount: knowledgeModelList.length) : Center(child: Text("暂无数据"),)): Center(child: LoadingWidget()));
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  bool get wantKeepAlive => true;

  _onRefresh() {
    getData();
  }

  Future getData() async{
    Future.delayed(Duration(seconds: 2), (){
      refreshController.refreshCompleted();
    });

    await knowledgeViewModel.getKnowledge().then((list){
      setState(() {
        knowledgeModelList = list;

        isRequest = true;
      });
    });
  }
}