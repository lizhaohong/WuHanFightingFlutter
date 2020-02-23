import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wu_han_fighting_flutter/config/const.dart';
import 'package:wu_han_fighting_flutter/page/home_page.dart';
import 'package:wu_han_fighting_flutter/page/knowledge_page.dart';
import 'package:wu_han_fighting_flutter/page/protect_page.dart';
import 'package:wu_han_fighting_flutter/page/rumor_page.dart';
import 'package:wu_han_fighting_flutter/widget/common_app_bar.dart';

class RootPage extends StatefulWidget {

  @override
  State createState() => _RootPageState();
}

class _RootPageState extends State <RootPage> {

  int _currentIndex = 0;

  PageController controller = PageController();

  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(icon:Image.asset("assets/images/bottom_home.png", color: mainTextColor, width: 30, height: 30),
        title: Text("首页"),
        activeIcon: Image.asset("assets/images/bottom_home.png", color: fixedColor, width: 30, height: 30)),
    BottomNavigationBarItem(icon:Image.asset("assets/images/bottom_rumor.png", color: mainTextColor, width: 30, height: 30),
        title: Text("辟谣"),
        activeIcon: Image.asset("assets/images/bottom_rumor.png", color: fixedColor, width: 30, height: 30)),
    BottomNavigationBarItem(icon:Image.asset("assets/images/bottom_protect.png", color: mainTextColor, width: 30, height: 30),
        title: Text("防护合辑"),
        activeIcon: Image.asset("assets/images/bottom_protect.png", color: fixedColor, width: 30, height: 30)),
    BottomNavigationBarItem(icon:Image.asset("assets/images/bottom_lore.png", color: mainTextColor, width: 30, height: 30),
        title: Text("疾病知识"),
        activeIcon: Image.asset("assets/images/bottom_lore.png", color: fixedColor, width: 30, height: 30)),
  ];

  List<String> titleItems = ["首页","辟谣","防护","知识"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleWidget:
      AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation){
//        var tween = Tween<double>(begin: 0, end: 1);
//        print("double = ${tween.animate(animation)}");
        return FadeTransition(
            opacity: animation,
            child: child
        );
            //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
      },child: Text(titleItems[_currentIndex],key: ValueKey(titleItems[_currentIndex]), style: TextStyle(color: Colors.white, fontSize: 20))), rightActions: <Widget>[
       MaterialButton(
         child: Text(
           "开源地址",
           style: TextStyle(
             color: Colors.white
           ),
         ),
         onPressed: (){
           launch("https://github.com/lizhaohong/WuHanFightingFlutter");
         },
       )
      ]),
      bottomNavigationBar: Theme(data: ThemeData(
//        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ), child: BottomNavigationBar(items: bottomNavigationBarItems, onTap: (int index){
        setState(() {
          _currentIndex = index;

          controller.jumpToPage(index);
        });
      },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        unselectedItemColor: mainTextColor,
        selectedItemColor: fixedColor,
      )),
      body: PageView.builder(
        itemCount: bottomNavigationBarItems.length,
        itemBuilder: (BuildContext context, int index) {
          if(index == 0) {
            return HomePage();
          } else if(index == 1) {
            return RumorPage();
          } else if(index == 2) {
            return ProtectPage();
          } else if(index == 3) {
            return KnowledgePage();
          }
        },
        controller: controller,
//        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;

            controller.jumpToPage(index);
          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}