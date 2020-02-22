import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wu_han_fighting_flutter/api/city_request_model.dart';

class StretchingListWidget extends StatefulWidget {
  List provinces = List();

  StretchingListWidget({@required this.provinces});

  @override
  State createState() => _StretchingListWidgetState();
}

class _StretchingListWidgetState extends State <StretchingListWidget> {

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600
    );

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(child: Text("地区", style: style)),
                  flex: 2,
                ),
                Expanded(
                  child: Center(child: Text("确诊", style: style,)),
                  flex: 1,
                ),
                Expanded(
                  child: Center(child: Text("死亡", style: style,)),
                  flex: 1,
                ),
                Expanded(
                  child: Center(child: Text("治愈", style: style,)),
                  flex: 1,
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
              ],
            ),
            height: 30,
          ),
          Column(
            children: widget.provinces.map((model){
              ProvinceModel provinceModel = model;

              return _StretchingListItemWidget(provinceModel);
            }).toList(),
          )
        ],
      ),
    );
  }
}

class _StretchingListItemWidget extends StatefulWidget {

  ProvinceModel model;


  _StretchingListItemWidget(this.model);

  @override
  State createState() => _StretchingListItemWidgetState();
}

class _StretchingListItemWidgetState extends State <_StretchingListItemWidget> {

  bool showAllList = false;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600
    );

    return InkWell(
      onTap: (){
        setState(() {
          showAllList = !showAllList;
        });
      }, child:
    Column(children: <Widget>[
      Container(
        color: showAllList ? Colors.black12 : Colors.white,
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Center(child: Text(widget.model.provinceName, maxLines: 2, overflow: TextOverflow.ellipsis, style: style)),
                flex: 2,
              ),
              Expanded(
                child: Center(child: Text("${widget.model.confirmedCount}", style: style,)),
                flex: 1,
              ),
              Expanded(
                child: Center(child: Text("${widget.model.deadCount}", style: style,)),
                flex: 1,
              ),
              Expanded(
                child: Center(child: Text("${widget.model.curedCount}", style: style,)),
                flex: 1,
              ),
              Expanded(
                child: showAllList ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down),
                flex: 1,
              ),
            ],
          )),
      Visibility(child: Column(children: widget.model.cities.map((city){
        Cities cityModel = city;
        return Container(
            color: showAllList ? Colors.black12 : Colors.white,
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(child: Text(cityModel.cityName, maxLines: 2, overflow: TextOverflow.ellipsis, style: style)),
                  flex: 2,
                ),
                Expanded(
                  child: Center(child: Text("${cityModel.confirmedCount}", style: style,)),
                  flex: 1,
                ),
                Expanded(
                  child: Center(child: Text("${cityModel.deadCount}", style: style,)),
                  flex: 1,
                ),
                Expanded(
                  child: Center(child: Text("${cityModel.curedCount}", style: style,)),
                  flex: 1,
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
              ],
            ));
      }).toList()), visible: showAllList)
    ]),
    );
  }
}