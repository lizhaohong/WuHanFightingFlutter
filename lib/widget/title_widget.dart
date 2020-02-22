import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/config/const.dart';

class TitleWidget extends StatelessWidget {

  String title;

  String subTitle;

  TitleWidget({@required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Container(decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: appBarColor
          ),
              width: 5,
              height: 15,
              margin: EdgeInsets.only(right: 10)
          ),
          Text(title, style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w600
          )),
          Spacer(),
          Text(subTitle??"", style: TextStyle(
              fontSize: 12,
              color: Colors.black38,
              fontWeight: FontWeight.w600
          )),
          Space(width: 10)
        ],
      ),
    );
  }
}