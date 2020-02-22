import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(padding: EdgeInsets.only(top: 10), child: Text("加载中"))
          ],
        ),
      ),
    );
  }
}