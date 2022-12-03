import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showFlutterToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: showToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { success, warning, error }

Color showToastColor(ToastState state) {
  Color? color;
  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.warning:
      color = Colors.yellow;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
  }
  return color;
}
