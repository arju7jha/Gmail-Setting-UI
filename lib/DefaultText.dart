import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


// class Item {
//   final String name;
//   final Color color;
//
//   Item(this.name, this.color);
// }

class DefaultTextSection extends StatefulWidget {
  @override
  _DefaultTextSectionState createState() => _DefaultTextSectionState();
}

class _DefaultTextSectionState extends State<DefaultTextSection> {
  String defaultText = "This is what your body text will look like.";
  String selectedTextFormatting = "Sans Serif";
  String selectedTextSize = "Normal";
  Color selectedTextColor = Colors.black;

  List<String> textFormattingOptions = [
    "Sans Serif",
    "Serif",
    "FixedWidth",
    "Wide",
    "Narrow",
    "lineThrough",
    "Garamond",
    "Georgia",
    "Tahoma",
    "Verdana",
    "Normal",
    "Italic",
    "Underline",
  ];

  List<String> textSizeOptions = [
    "Small",
    "Normal",
    "Large",
    "Huge",
  ];

  List<String> textColorOptions = [
    "Black",
    "Red",
    "Blue",
    "Green",
  ];

  // void changeColor(Color color) {
  //   setState(() => selectedTextColor = color);
  // }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTextFormattingDropdown(),
                buildTextSizeDropdown(),
                buildTextColorDropdown(),
                buildRemoveFormattingButton(),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              defaultText,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: getFontSize(selectedTextSize),
                color: selectedTextColor,
                decoration: getTextDecoration(selectedTextFormatting),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getFontSize(String size) {
    switch (size) {
      case "Small":
        return 12.0;
      case "Normal":
        return 16.0;
      case "Large":
        return 20.0;
      case "Huge":
        return 24.0;
      default:
        return 16.0;
    }
  }

  Color getColor(String color) {
    switch (color) {
      case "Black":
        return Colors.black;
      case "Red":
        return Colors.red;
      case "Blue":
        return Colors.blue;
      case "Green":
        return Colors.green;
      case "Yellow":
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }

  TextDecoration getTextDecoration(String formatting) {
    switch (formatting) {
      case "Normal":
        return TextDecoration.none;
      case "lineThrough":
        return TextDecoration.lineThrough;
      case "Underline":
        return TextDecoration.underline;
      default:
        return TextDecoration.none;
    }
  }

  Widget buildTextFormattingDropdown() {
    return DropdownButton<String>(
      value: selectedTextFormatting,
      onChanged: (newValue) {
        setState(() {
          selectedTextFormatting = newValue!;
        });
      },
      items:
      textFormattingOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget buildTextSizeDropdown() {
    return DropdownButton<String>(
      value: selectedTextSize,
      onChanged: (newValue) {
        setState(() {
          selectedTextSize = newValue!;
        });
      },
      items: textSizeOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget buildTextColorDropdown() {
    return Row(
      children: [
        const Icon(Icons.format_color_text),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => showColorPickerDialog(),
          child: Container(
            width: 20,
            height: 20,
            color: selectedTextColor,
          ),
        ),
      ],
    );
  }
  void showColorPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pick a color"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedTextColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedTextColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {}); // Rebuild the widget after color change
              },
            ),
          ],
        );
      },
    );
  }


  Widget buildRemoveFormattingButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedTextFormatting = "Normal";
          selectedTextSize = "Normal";
          selectedTextColor = Colors.black;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Set the background color to white
      ),
      child: Icon(Icons.format_clear, color: Colors.black,),
    );
  }

  // Widget buildSectionTitle(String title) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 10.0),
  //     child: Text(
  //       title,
  //       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //     ),
  //   );
  // }
// ... (Paste the rest of the default text-related code)
}
