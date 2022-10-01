import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PickColor extends StatefulWidget {
  const PickColor({Key? key}) : super(key: key);

  @override
  State<PickColor> createState() => _PickColorState();
}

class _PickColorState extends State<PickColor> {
  String title = 'Color Picker';

  Color pickerColor = const Color(0xff2196f3);
  Color currentColor = const Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    var color =
        pickerColor.toString().replaceAll(RegExp(r'(?:_|[^\w\s])+'), '');
    var rSpaceColor = color.replaceAll(RegExp(r'(\s)'), '');

    var rcolorText = rSpaceColor.toLowerCase().replaceAll(RegExp(r'color'), '');

    var materialPrimaryvalue = 'materialprimaryvalue'.toLowerCase();
    var replaceWith = '';
    var colorCode = rcolorText.replaceAll(materialPrimaryvalue, replaceWith);

    int colorCodeInt = num.tryParse(colorCode) as int;
    Color selectedColor = Color(colorCodeInt);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: pickerColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pickerColor.toString(),
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(),
            Text(
              colorCode.toString(),
              style: const TextStyle(fontSize: 30.0),
            ),
            const Divider(),
            Text(
              selectedColor.toString(),
              style: const TextStyle(fontSize: 30.0),
            ),
            const Divider(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: pickerColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  padding: const EdgeInsets.only(
                      left: 30.0, top: 0.0, right: 30.0, bottom: 0.0)),
              onPressed: (() {
                colorPickerDialog();
              }),
              child: const Text('PICK COLOR'),
            ),
          ],
        ),
      ),
    );
  }

  Future colorPickerDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                padding: const EdgeInsets.only(
                    left: 30.0, top: 0.0, right: 30.0, bottom: 0.0)),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('CLOSE', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
