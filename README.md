## 项目简介

获取冠状肺炎实时动态App，支持Android和iOS, 本项目是在Flutter version 1.12.13的基础下开发完毕
如果是1.9.1版本的 cached_network_image需要修改为1.1.1版本即可

本应用接口使用https://github.com/fluttercandies/ncov_2019 项目所提供的接口

## App效果图

![](https://github.com/lizhaohong/WuHanFightingFlutter/blob/master/assets/display/picture1.png)

![](https://github.com/lizhaohong/WuHanFightingFlutter/blob/master/assets/display/picture2.png)

![](https://github.com/lizhaohong/WuHanFightingFlutter/blob/master/assets/display/picture3.png)

![](https://github.com/lizhaohong/WuHanFightingFlutter/blob/master/assets/display/picture4.png)

![](https://github.com/lizhaohong/WuHanFightingFlutter/blob/master/assets/display/picture5.png)

![](https://github.com/lizhaohong/WuHanFightingFlutter/blob/master/assets/display/picture6.png)

![](https://github.com/lizhaohong/WuHanFightingFlutter/blob/master/assets/display/picture7.png)

![](https://github.com/lizhaohong/WuHanFightingFlutter/blob/master/assets/display/picture8.png)

## 使用须知
在pubspec.yaml文件中，关于flutter版本使用cached_network_image插件问题，默认使用2.0.0(Flutter1.12.13+)

```
#cached_network_image: 1.1.1 # 1.9.0左右flutter版本的用这个
cached_network_image: 2.0.0 # 2.0.0左右flutter版本直接用这个
```
  
## 使用教程
```
使用命令（拉取项目）：git clone https://github.com/lizhaohong/WuHanFightingFlutter.git
然后命令（获取依赖）：flutter packages get (iOS执行iOS部分再执行下一步)
最后命令（运行）：$ flutter run

iOS的部分
进入项目IOS目录：$ cd ios/
安装Pod：$ pod install
```

## 本应用使用到的生成model的工具是 JsonToDart
地址是 https://github.com/fluttercandies/JsonToDart/
该工具类很好用，推荐大家使用