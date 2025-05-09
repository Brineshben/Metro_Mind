import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle systemUiOverlayStyleDark = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent, // transparent status bar
  statusBarIconBrightness: Brightness.dark, // dark icons
  statusBarBrightness: Brightness.dark, // iOS
);

SystemUiOverlayStyle systemUiOverlayStyleLight = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent, // transparent status bar
  statusBarIconBrightness: Brightness.light, // dark icons
  statusBarBrightness: Brightness.light, // iOS
);