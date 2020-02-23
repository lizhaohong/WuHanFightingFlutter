import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wu_han_fighting_flutter/api/rumor_request_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';

class RumorCard extends StatefulWidget {

  RumorModel rumorModel;

  RumorCard({this.rumorModel});

  @override
  State createState() => _RumorCardState();
}

class _RumorCardState extends State <RumorCard> {

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(left: 15, right: 15, top: 15),padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15), decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xff68869e), Color(0xff292f4b)]) ,
        borderRadius: BorderRadius.circular(5)
    ),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.rumorModel.title, style:
        TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18
        )
        ),
        Space(height: 10),
        Container(
          padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 10), child: Text(widget.rumorModel.mainSummary, style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54
              ))),
              Visibility(child: Text(widget.rumorModel.body, style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38
              )), visible: showAll),
              Space(height: 5),
              GestureDetector(
                onTap: (){
                  setState(() {
                    showAll = !showAll;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(showAll ? "收起详情" : "展开详情"),
                    Icon(showAll ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)
                  ],
                )
              )
            ],
          ),
        )
      ],
    ),
    );
  }
}