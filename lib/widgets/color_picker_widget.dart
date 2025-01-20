
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/helpers/show_snack_bar.dart';

class MyColorPicker extends StatefulWidget {
  const MyColorPicker(
      {super.key, required this.getPickedColor, this.enableSnackBar = false});
  final Function(int) getPickedColor;
  final bool enableSnackBar;

  @override
  State<MyColorPicker> createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);
// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick a color!'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: pickerColor,
          onColorChanged: changeColor,
        ),
        // Use Material color picker:
        //
        // child: MaterialPicker(
        //   pickerColor: pickerColor,
        //   onColorChanged: changeColor,
        //   showLabel: true, // only on portrait mode
        // ),
        //
        // Use Block color picker:
        //
        // child: BlockPicker(
        //   pickerColor: currentColor,
        //   onColorChanged: changeColor,
        // ),
        //
        // child: MultipleChoiceBlockPicker(
        //   pickerColors: currentColors,
        //   onColorsChanged: changeColors,
        // ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Got it'),
          onPressed: () {
            setState(() => currentColor = pickerColor);
            widget.getPickedColor(currentColor.value);
            widget.enableSnackBar
                ? showSnackBar(
                    context: context, message: "color changed succeffuly")
                : null;
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
