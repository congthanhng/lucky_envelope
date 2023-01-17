import 'package:flutter/material.dart';

class DefaultDialog{
  static BuildContext? _globalContext;

  static initGlobalContext(BuildContext context){
    _globalContext = Navigator.of(context, rootNavigator: true).context;
  }

  static void show(
      BuildContext context, {
        bool barrierDismissible = false,
        required Widget body
      }) {
    initGlobalContext(context);
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,

        builder: (context) {
          var width = MediaQuery.of(context).size.width;
          return body;
        });
  }

  static dismiss() {
    final context = _globalContext;
    if (context != null) {
      Navigator.pop(context);
    }
  }

  static dismissAndPushNamed(String routeName) {
    final context = _globalContext;
    if (context != null) {
      Navigator.popAndPushNamed(context, routeName);
    }
  }
}