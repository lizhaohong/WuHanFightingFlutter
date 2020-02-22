import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wu_han_fighting_flutter/widget/common_app_bar.dart';
import 'package:wu_han_fighting_flutter/widget/loading_widget.dart';

class WebViewPage extends StatefulWidget {

  String url;

  String title;

  WebViewPage({@required this.url, this.title});

  @override
  State createState() => _WebViewPageState();
}

class _WebViewPageState extends State <WebViewPage> {
  WebViewController _webViewController;

  bool loadingSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: widget.title ?? ""),
      body: WillPopScope(child:Stack(
        children: <Widget>[
          WebView(
              initialUrl: widget.url,
              onPageFinished: (String data) {
                print('onPageFinished: ${widget.url}');

                setState(() {
                  loadingSuccess = true;
                });
              },
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller){
                _webViewController = controller;
              },
              navigationDelegate: (NavigationRequest request) {
                print('allowing navigation to $request');

                return NavigationDecision.navigate;
              }),
          Visibility(child: LoadingWidget(), visible: !loadingSuccess)
        ],
      ),
          onWillPop: pop),
    );
  }

  Future<bool> pop() async {
    bool canBack = await _webViewController.canGoBack();

    if(canBack) {
      _webViewController.goBack();

      return false;
    } else {
      return true;
    }
  }
}