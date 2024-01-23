
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Item {
  final String name;
  final Color color;

  Item(this.name, this.color);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Settings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  List<String> inUseStars = ["Yellow"];
  List<String> notInUseStars = ["Red", "Green", "Purple", "Orange", "Pink", "Cyan"];

  List<String> allLanguages = [
    "Afrikaans",
    "Azərbaycanca",
    "Bahasa Indonesia",
    "Bahasa Melayu",
    "Català",
    "Čeština",
    "Cymraeg",
    "Dansk",
    "Deutsch",
    "Eesti keel",
    "English",
    "English (UK)",
    "English (US)",
    "Español",
    "Español (Latinoamérica)",
    "Euskara",
    "French",
    "Filipino",
    "Français",
    "Magyar",
    "Spanish",
  ];

  List<String> allCountryCode = [
    "Afghanistan",
    "Angola",
    "Australia",
    "Bangladesh",
    "Bermuda",
    "Bhutan",
    "Brazil",
    "China",
    "Cuba",
    "Denmark",
    "Dominica",
    "Egypt",
    "Estonia",
    "Finland",
    "France",
    "Germany",
    "Georgia",
    "Greece",
    "Hong Kong",
    "Iceland",
    "India",
    "Iran",
    "Iraq",
    "Italy",
    "Japan",
    "Jordan",
    "Korea",
    "Kenia",
    "Libya",
    "Mexico",
    "Nepal",
    "Span",
  ];

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

  String selectedLanguage = "English"; // Default selected language
  String selectedPhoneNumber = "India"; // Default country code for India

  String defaultText = "This is what your body text will look like.";
  String selectedTextFormatting = "Sans Serif";
  String selectedTextSize = "Normal";
  Color selectedTextColor = Colors.black;

  void changeColor(Color color) {
    setState(() => selectedTextColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gmail Settings - UI'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  buildSectionTitle("Language : "),
                  const SizedBox(width: 10),
                  buildLanguageDropdown(),
                ],
              ),
              Row(
                children: [
                  buildSectionTitle("Phone numbers : "),
                  const SizedBox(width: 10),
                  buildPhoneNumberInput(),
                ],
              ),
              buildSectionTitle("Default text : "),
              buildDefaultTextCard(),

              buildSectionTitle("Stars : "),
              buildStarsSection(),

              buildSectionTitle("Signature : "),
              buildSignatureSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDefaultTextCard() {
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

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildLanguageDropdown() {
    return DropdownButton<String>(
      value: selectedLanguage,
      onChanged: (newValue) {
        setState(() {
          selectedLanguage = newValue!;
        });
      },
      items: allLanguages.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget buildPhoneNumberInput() {
    return DropdownButton<String>(
      value: selectedPhoneNumber,
      onChanged: (newValue) {
        setState(() {
          selectedPhoneNumber = newValue!;
        });
      },
      items: allCountryCode.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  //Stars**********************************************************


  Widget buildStarsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPresetsRow(),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("In-use Stars:"),
            const SizedBox(width: 10),
            buildStarsList(inUseStars, true),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Not-in-use Stars:"),
            const SizedBox(width: 10),
            buildStarsList(notInUseStars, false),
          ],
        ),
      ],
    );
  }

  Widget buildPresetsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Presets:"),
        buildPresetButton("1 star", ["Gold"], ),
        buildPresetButton("4 stars", ["Gold", "Blue", "Red", "Green"]),
        buildPresetButton("All stars", ["Gold", "Blue", "Red", "Green", "Yellow", "Purple", "Orange", "Pink", "Cyan"]),
      ],
    );
  }

  List<String> allStars = ["Gold", "Blue", "Red", "Green", "Yellow", "Purple", "Orange", "Pink", "Cyan"];

  Widget buildPresetButton(String label, List<String> stars) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          inUseStars = [...stars];
          notInUseStars = allStars.where((star) => !inUseStars.contains(star)).toList();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: Text(label, style: TextStyle(color: Colors.blue),),
    );
  }

  Widget buildStarsList(List<String> stars, bool inUse) {
    return Expanded(
      child: DragTarget<String>(
        onAccept: (star) {
          setState(() {
            if (inUse && !inUseStars.contains(star)) {
              inUseStars.add(star);
              notInUseStars.remove(star);
            } else if (!inUse && !notInUseStars.contains(star)) {
              notInUseStars.add(star);
              inUseStars.remove(star);
            }
          });
        },

        builder: (context, candidateData, rejectedData) {
          return Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: stars.map((star) {
              return Draggable<String>(
                data: star,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: inUse ? Colors.transparent : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.star,
                    color: getColorForStar(star),
                  ),
                ),
                feedback: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: inUse ? Colors.yellow : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.star,
                    color: getColorForStar(star),
                  ),

                ),
                childWhenDragging: Container(),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Color getColorForStar(String star) {
    switch (star) {
      case "Gold":
        return Colors.amber;
      case "Blue":
        return Colors.blue;
      case "Red":
        return Colors.red;
      case "Green":
        return Colors.green;
      case "Yellow":
        return Colors.yellow;
      case "Purple":
        return Colors.purple;
      case "Orange":
        return Colors.orange;
      case "Pink":
        return Colors.pink;
      case "Cyan":
        return Colors.cyan;
      default:
        return Colors.black;
    }
  }


//Signature**********************************************************
  List<String> signatures = [];

  // Widget buildSignatureSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       buildAddSignatureButton(),
  //       const SizedBox(height: 20),
  //       buildSignaturesBox(),
  //     ],
  //   );
  // }
  //
  // Widget buildAddSignatureButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       setState(() {
  //         // Open a dialog to input a new signature
  //         _showAddSignatureDialog();
  //       });
  //     },
  //     style: ElevatedButton.styleFrom(
  //       primary: Colors.white, // Set the background color to white
  //     ),
  //     child: const Text("Add Signature", style: TextStyle(color: Colors.blue)), // Set the text color to black
  //   );
  // }

  TextEditingController signatureEditController = TextEditingController();

  Widget buildSignatureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            buildAddSignatureButton(),
            const SizedBox(width: 10),
            if (signatures.isNotEmpty) buildEditingTools(),
          ],
        ),
        const SizedBox(height: 20),
        buildSignaturesBox(),
      ],
    );
  }

  Widget buildAddSignatureButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // Open a dialog to input a new signature
          _showAddSignatureDialog();
          // Initialize the editing controller with the first signature if it exists
          if (signatures.isNotEmpty) {
            signatureEditController.text = signatures.first;
          }
        });
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Set the background color to white
      ),
      child: const Text("Create New", style: TextStyle(color: Colors.black)), // Set the text color to black
    );
  }

  Widget buildEditingTools() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: signatureEditController,
          minLines: 3,
          maxLines: 100,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "",
          ),
        ),
      ),
    );
  }


  void _showAddSignatureDialog() {
    TextEditingController signatureController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Signature"),
          content: TextField(
            controller: signatureController,
            decoration: const InputDecoration(labelText: 'Enter your signature'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  signatures.add(signatureController.text);
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildSignaturesBox() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: signatures.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(signatures[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showEditSignatureDialog(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      signatures.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showEditSignatureDialog(int index) {
    TextEditingController signatureController = TextEditingController(text: signatures[index]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Signature"),
          content: TextField(
            controller: signatureController,
            decoration: const InputDecoration(labelText: 'Edit your signature'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  signatures[index] = signatureController.text;
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

}


