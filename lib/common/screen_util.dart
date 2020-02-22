import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenTop(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

double screenBottom(BuildContext context) {
  return MediaQuery.of(context).padding.bottom;
}

double screenLeft(BuildContext context) {
  return MediaQuery.of(context).padding.left;
}

double screenRight(BuildContext context) {
  return MediaQuery.of(context).padding.right;
}

double statusBarHeight(BuildContext context) {
  return MediaQueryData.fromWindow(window).padding.top;
}

double navigationBarHeight() {
  return kToolbarHeight;
}

double topBarHeight() {
  return kToolbarHeight + MediaQueryData.fromWindow(window).padding.top;
}
