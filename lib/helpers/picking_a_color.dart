import 'package:flutter/material.dart';
import 'package:notes_app/widgets/color_picker_widget.dart';

Future<dynamic> pick_a_color(
    {required BuildContext context,
    required Function(int) getPickedColor,
    bool enableSnackBar = false}) {
  return showDialog(
      context: context,
      builder: (context) {
        return MyColorPicker(
          getPickedColor: getPickedColor,
          enableSnackBar: enableSnackBar,
        );
      });
}
