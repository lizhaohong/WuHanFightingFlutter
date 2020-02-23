import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wu_han_fighting_flutter/api/statistic_request_model.dart';

class StatisticWidget extends StatelessWidget {

  StatisticModel statisticModel;

  StatisticWidget({@required this.statisticModel});

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontSize: 15,
        color: Colors.black
    );

    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text("${statisticModel.confirmedCount}", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.red
                ),),
                Text("全国确诊",style: style),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text("${statisticModel.suspectedCount}", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.yellow
                ),),
                Text("疑似病例",style: style),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text("${statisticModel.curedCount}", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.green
                ),),
                Text("治愈人数",style: style),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text("${statisticModel.deadCount}", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black38
                ),),
                Text("死亡人数",style: style),
              ],
            ),
          ),
        ],
      ),
    );
  }
}