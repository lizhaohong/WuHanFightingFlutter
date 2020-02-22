import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wu_han_fighting_flutter/config/const.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {

  Widget titleWidget;
  String title;
  Color backgroundColor = appBarColor;
  Widget leadingWidget;
  String leadingImgSrc;
  Color mainColor = Colors.white;
  PreferredSizeWidget bottom;
  List <Widget> rightActions;


  CommonAppBar({this.titleWidget, this.title, this.backgroundColor,
    this.leadingWidget, this.leadingImgSrc, this.mainColor, this.bottom,
    this.rightActions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget == null ? Text(title, style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.white
      )) :  titleWidget,
      backgroundColor: backgroundColor,
      elevation: 0,
      brightness: Brightness.dark,
      leading: leadingWidget ?? defaultLeading(context),
      centerTitle: false,
      bottom: bottom ?? bottom,
      actions: rightActions ?? [new Container()],
    );
  }

  @override
  Size get preferredSize => Size(100, 50);

  Widget defaultLeading(BuildContext context) {
    final bool isShow = Navigator.canPop(context);

    if(isShow) {
      return InkWell(
        child: Container(
          width: 15,
          height: 28,
          child: leadingImgSrc != null ? Image.asset(leadingImgSrc) : Icon(CupertinoIcons.back, color: mainColor),
        ),
        onTap: (){
          if(Navigator.canPop(context)) {
            ///取消键盘
            FocusScope.of(context).requestFocus(FocusNode());

            Navigator.pop(context);
          }
        },
      );
    } else {
      return null;
    }
  }
}