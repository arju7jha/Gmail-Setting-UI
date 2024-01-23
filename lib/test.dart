//latest

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
  List<String> inUseStars = [];
  List<String> notInUseStars = ["Red", "Green", "Yellow", "Purple", "Orange", "Pink", "Cyan"];

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
    "Garamond",
    "Georgia",
    "Tahoma",
    "Verdana",
    "Normal",
    "Bold",
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
              // Implement Signature UI here
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
    // case "Bold":
    //   return TextDecoration.bold;
    // case "Italic":
    //   return TextDecoration.italic;
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
        const Text("Text Color:"),
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
      child: const Text("RF"),
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

  Widget buildStarsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("In-use Stars:"),
            const SizedBox(width: 10),
            buildStarsList(inUseStars, true),
            buildDragTarget(true), // Drag target for In-use Stars
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Not-in-use Stars:"),
            const SizedBox(width: 10),
            buildStarsList(notInUseStars, false),
            buildDragTarget(false), // Drag target for Not-in-use Stars
          ],
        ),
      ],
    );
  }

  Widget buildStarsList(List<String> stars, bool inUse) {
    return Expanded(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: stars.map((star) {
          return Draggable<String>(
            data: star,
            child: Container(
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
      ),
    );
  }

  Widget buildDragTarget(bool inUse) {
    return DragTarget<String>(
      onAccept: (star) {
        setState(() {
          if (inUse) {
            inUseStars.add(star);
            notInUseStars.remove(star);
          } else {
            notInUseStars.add(star);
            inUseStars.remove(star);
          }
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.only(right: 50,),
          width: 50,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
          ),
        );
      },
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
}














// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Gmail Settings',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: SettingsPage(),
// //     );
// //   }
// // }
// //
// // class SettingsPage extends StatefulWidget {
// //   @override
// //   _SettingsPageState createState() => _SettingsPageState();
// // }
// //
// // class _SettingsPageState extends State<SettingsPage> {
// //   List<String> inUseStars = ["Gold", "Blue"];
// //   List<String> notInUseStars = ["Red", "Green"];
// //
// //   List<String> allLanguages = [
// //     "Afrikaans",
// //     "Azərbaycanca",
// //     "Bahasa Indonesia",
// //     "Bahasa Melayu",
// //     "Català",
// //     "Čeština",
// //     "Cymraeg",
// //     "Dansk",
// //     "Deutsch",
// //     "Eesti keel",
// //     "English",
// //     "English (UK)",
// //     "English (US)",
// //     "Español",
// //     "Español (Latinoamérica)",
// //     "Euskara",
// //     "French",
// //     "Filipino",
// //     "Français",
// //     "Magyar",
// //     "Spanish",
// //   ];
// //
// //   List<String> allCountryCode = [
// //     "Afghanistan",
// //     "Angola",
// //     "Australia",
// //     "Bangladesh",
// //     "Bermuda",
// //     "Bhutan",
// //     "Brazil",
// //     "China",
// //     "Cuba",
// //     "Denmark",
// //     "Dominica",
// //     "Egypt",
// //     "Estonia",
// //     "Finland",
// //     "France",
// //     "Germany",
// //     "Georgia",
// //     "Greece",
// //     "Hong Kong",
// //     "Iceland",
// //     "India",
// //     "Iran",
// //     "Iraq",
// //     "Italy",
// //     "Japan",
// //     "Jordan",
// //     "Korea",
// //     "Kenia",
// //     "Libya",
// //     "Mexico",
// //     "Nepal",
// //     "Span",
// //   ];
// //
// //
// //   String selectedLanguage = "English"; // Default selected language
// //   String selectedPhoneNumber = "India"; // Default country code for India
// //
// //   // Default text settings
// //   String selectedFontStyle = "Sans Serif";
// //   String selectedTextSize = "Normal";
// //   Color selectedTextColor = Colors.black;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Gmail Settings - UI'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 buildSectionTitle("Language : "),
// //                 SizedBox(width: 10),
// //                 buildLanguageDropdown(),
// //               ],
// //             ),
// //             Row(
// //               children: [
// //                 buildSectionTitle("Phone numbers : "),
// //                 SizedBox(width: 10),
// //                 buildPhoneNumberInput(),
// //               ],
// //             ),
// //             buildSectionTitle("Default text : "),
// //             buildDefaultTextCard(),
// //             buildSectionTitle("Stars : "),
// //             buildStarsSection(),
// //             buildSectionTitle("Signature : "),
// //             // Implement Signature UI here
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildSectionTitle(String title) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 10.0),
// //       child: Text(
// //         title,
// //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //       ),
// //     );
// //   }
// //
// //   Widget buildLanguageDropdown() {
// //     return DropdownButton<String>(
// //       value: selectedLanguage,
// //       onChanged: (newValue) {
// //         setState(() {
// //           selectedLanguage = newValue!;
// //         });
// //       },
// //       items: allLanguages.map<DropdownMenuItem<String>>((String value) {
// //         return DropdownMenuItem<String>(
// //           value: value,
// //           child: Text(value),
// //         );
// //       }).toList(),
// //     );
// //   }
// //
// //   Widget buildPhoneNumberInput() {
// //     return DropdownButton<String>(
// //       value: selectedPhoneNumber,
// //       onChanged: (newValue) {
// //         setState(() {
// //           selectedPhoneNumber = newValue!;
// //         });
// //       },
// //       items: allCountryCode.map<DropdownMenuItem<String>>((String value) {
// //         return DropdownMenuItem<String>(
// //           value: value,
// //           child: Text(value),
// //         );
// //       }).toList(),
// //     );
// //   }
// //
// //   Widget buildDefaultTextCard() {
// //     return Card(
// //       elevation: 4,
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text("This is what your body text will look like."),
// //             SizedBox(height: 20),
// //             buildTextFormattingDropdown(),
// //             SizedBox(height: 10),
// //             buildTextSizeDropdown(),
// //             SizedBox(height: 10),
// //             buildTextColorDropdown(),
// //             SizedBox(height: 10),
// //             buildRemoveFormattingButton(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildTextFormattingDropdown() {
// //     return Row(
// //       children: [
// //         Text("Text Formatting: "),
// //         SizedBox(width: 10),
// //         DropdownButton<String>(
// //           value: selectedFontStyle,
// //           onChanged: (newValue) {
// //             setState(() {
// //               selectedFontStyle = newValue!;
// //             });
// //           },
// //           items: [
// //             "Sans Serif",
// //             "Serif",
// //             "Fixed Width",
// //             "Wide",
// //             "Narrow",
// //             "Comic Sans MS",
// //             "Garamond",
// //             "Georgia",
// //             "Tahoma",
// //             "Trebuchet MS",
// //             "Verdana",
// //           ].map<DropdownMenuItem<String>>((String value) {
// //             return DropdownMenuItem<String>(
// //               value: value,
// //               child: Text(value),
// //             );
// //           }).toList(),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget buildTextSizeDropdown() {
// //     return Row(
// //       children: [
// //         Text("Text Size: "),
// //         SizedBox(width: 10),
// //         DropdownButton<String>(
// //           value: selectedTextSize,
// //           onChanged: (newValue) {
// //             setState(() {
// //               selectedTextSize = newValue!;
// //             });
// //           },
// //           items: ["Small", "Normal", "Large", "Huge"].map<DropdownMenuItem<String>>((String value) {
// //             return DropdownMenuItem<String>(
// //               value: value,
// //               child: Text(value),
// //             );
// //           }).toList(),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget buildTextColorDropdown() {
// //     return Row(
// //       children: [
// //         Text("Text Color: "),
// //         SizedBox(width: 10),
// //         DropdownButton<Color>(
// //           value: selectedTextColor,
// //           onChanged: (newValue) {
// //             setState(() {
// //               selectedTextColor = newValue!;
// //             });
// //           },
// //           items: [
// //             Colors.black,
// //             Colors.red,
// //             Colors.blue,
// //             Colors.green,
// //             Colors.orange,
// //             Colors.purple,
// //           ].map<DropdownMenuItem<Color>>((Color color) {
// //             return DropdownMenuItem<Color>(
// //               value: color,
// //               child: Container(
// //                 width: 20,
// //                 height: 20,
// //                 color: color,
// //               ),
// //             );
// //           }).toList(),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget buildRemoveFormattingButton() {
// //     return ElevatedButton(
// //       onPressed: () {
// //         // Implement logic to remove formatting
// //         setState(() {
// //           selectedFontStyle = "Sans Serif";
// //           selectedTextSize = "Normal";
// //           selectedTextColor = Colors.black;
// //         });
// //       },
// //       child: Text("Remove Formatting"),
// //     );
// //   }
// //
// //
// //   Widget buildStarsSection() {
// //     return Row(
// //       children: [
// //         Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text("In-use Stars:"),
// //               buildStarsList(inUseStars, true),
// //             ],
// //           ),
// //         ),
// //         SizedBox(width: 20),
// //         Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text("Not-in-use Stars:"),
// //               buildStarsList(notInUseStars, false),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget buildStarsList(List<String> stars, bool inUse) {
// //     return DragTarget<String>(
// //       onAccept: (star) {
// //         setState(() {
// //           if (inUse) {
// //             inUseStars.add(star);
// //             notInUseStars.remove(star);
// //           } else {
// //             notInUseStars.add(star);
// //             inUseStars.remove(star);
// //           }
// //         });
// //       },
// //       builder: (context, candidateData, rejectedData) {
// //         return Container(
// //           height: 100,
// //           decoration: BoxDecoration(
// //             border: Border.all(color: Colors.black),
// //           ),
// //           child: ListView.builder(
// //             itemCount: stars.length,
// //             itemBuilder: (context, index) {
// //               return Draggable<String>(
// //                 data: stars[index],
// //                 child: Card(
// //                   margin: EdgeInsets.all(8),
// //                   color: inUse ? Colors.yellow : Colors.grey,
// //                   child: ListTile(
// //                     title: Text(stars[index]),
// //                   ),
// //                 ),
// //                 feedback: Card(
// //                   margin: EdgeInsets.all(8),
// //                   child: ListTile(
// //                     title: Text(stars[index]),
// //                   ),
// //                 ),
// //                 childWhenDragging: Container(),
// //               );
// //             },
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// //
//

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Gmail Settings',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SettingsPage(),
//     );
//   }
// }
//
// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   List<String> inUseStars = ["Gold", "Blue"];
//   List<String> notInUseStars = ["Red", "Green"];
//
//   List<String> allLanguages = [
//     "Afrikaans",
//     "Azərbaycanca",
//     "Bahasa Indonesia",
//     "Bahasa Melayu",
//     "Català",
//     "Čeština",
//     "Cymraeg",
//     "Dansk",
//     "Deutsch",
//     "Eesti keel",
//     "English",
//     "English (UK)",
//     "English (US)",
//     "Español",
//     "Español (Latinoamérica)",
//     "Euskara",
//     "French",
//     "Filipino",
//     "Français",
//     "Magyar",
//     "Spanish",
//   ];
//
//   List<String> allCountryCode = [
//     "Afghanistan",
//     "Angola",
//     "Australia",
//     "Bangladesh",
//     "Bermuda",
//     "Bhutan",
//     "Brazil",
//     "China",
//     "Cuba",
//     "Denmark",
//     "Dominica",
//     "Egypt",
//     "Estonia",
//     "Finland",
//     "France",
//     "Germany",
//     "Georgia",
//     "Greece",
//     "Hong Kong",
//     "Iceland",
//     "India",
//     "Iran",
//     "Iraq",
//     "Italy",
//     "Japan",
//     "Jordan",
//     "Korea",
//     "Kenia",
//     "Libya",
//     "Mexico",
//     "Nepal",
//     "Span",
//   ];
//
//
//   String selectedLanguage = "English"; // Default selected language
//   String selectedPhoneNumber = "India"; // Default country code for India
//
//   // Default text settings
//   String selectedFontStyle = "Sans Serif";
//   String selectedTextSize = "Normal";
//   Color selectedTextColor = Colors.black;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gmail Settings - UI'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 buildSectionTitle("Language : "),
//                 SizedBox(width: 10),
//                 buildLanguageDropdown(),
//               ],
//             ),
//             Row(
//               children: [
//                 buildSectionTitle("Phone numbers : "),
//                 SizedBox(width: 10),
//                 buildPhoneNumberInput(),
//               ],
//             ),
//             buildSectionTitle("Default text : "),
//             buildDefaultTextCard(),
//             buildSectionTitle("Stars : "),
//             buildStarsSection(),
//             buildSectionTitle("Signature : "),
//             // Implement Signature UI here
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
//
//   Widget buildLanguageDropdown() {
//     return DropdownButton<String>(
//       value: selectedLanguage,
//       onChanged: (newValue) {
//         setState(() {
//           selectedLanguage = newValue!;
//         });
//       },
//       items: allLanguages.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget buildPhoneNumberInput() {
//     return DropdownButton<String>(
//       value: selectedPhoneNumber,
//       onChanged: (newValue) {
//         setState(() {
//           selectedPhoneNumber = newValue!;
//         });
//       },
//       items: allCountryCode.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget buildDefaultTextCard() {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("This is what your body text will look like."),
//             SizedBox(height: 20),
//             buildTextFormattingDropdown(),
//             SizedBox(height: 10),
//             buildTextSizeDropdown(),
//             SizedBox(height: 10),
//             buildTextColorDropdown(),
//             SizedBox(height: 10),
//             buildRemoveFormattingButton(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextFormattingDropdown() {
//     return Row(
//       children: [
//         Text("Text Formatting: "),
//         SizedBox(width: 10),
//         DropdownButton<String>(
//           value: selectedFontStyle,
//           onChanged: (newValue) {
//             setState(() {
//               selectedFontStyle = newValue!;
//             });
//           },
//           items: [
//             "Sans Serif",
//             "Serif",
//             "Fixed Width",
//             "Wide",
//             "Narrow",
//             "Comic Sans MS",
//             "Garamond",
//             "Georgia",
//             "Tahoma",
//             "Trebuchet MS",
//             "Verdana",
//           ].map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTextSizeDropdown() {
//     return Row(
//       children: [
//         Text("Text Size: "),
//         SizedBox(width: 10),
//         DropdownButton<String>(
//           value: selectedTextSize,
//           onChanged: (newValue) {
//             setState(() {
//               selectedTextSize = newValue!;
//             });
//           },
//           items: ["Small", "Normal", "Large", "Huge"].map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTextColorDropdown() {
//     return Row(
//       children: [
//         Text("Text Color: "),
//         SizedBox(width: 10),
//         DropdownButton<Color>(
//           value: selectedTextColor,
//           onChanged: (newValue) {
//             setState(() {
//               selectedTextColor = newValue!;
//             });
//           },
//           items: [
//             Colors.black,
//             Colors.red,
//             Colors.blue,
//             Colors.green,
//             Colors.orange,
//             Colors.purple,
//           ].map<DropdownMenuItem<Color>>((Color color) {
//             return DropdownMenuItem<Color>(
//               value: color,
//               child: Container(
//                 width: 20,
//                 height: 20,
//                 color: color,
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
//
//   Widget buildRemoveFormattingButton() {
//     return ElevatedButton(
//       onPressed: () {
//         // Implement logic to remove formatting
//         setState(() {
//           selectedFontStyle = "Sans Serif";
//           selectedTextSize = "Normal";
//           selectedTextColor = Colors.black;
//         });
//       },
//       child: Text("Remove Formatting"),
//     );
//   }
//
//
//   Widget buildStarsSection() {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("In-use Stars:"),
//               buildStarsList(inUseStars, true),
//             ],
//           ),
//         ),
//         SizedBox(width: 20),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Not-in-use Stars:"),
//               buildStarsList(notInUseStars, false),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildStarsList(List<String> stars, bool inUse) {
//     return DragTarget<String>(
//       onAccept: (star) {
//         setState(() {
//           if (inUse) {
//             inUseStars.add(star);
//             notInUseStars.remove(star);
//           } else {
//             notInUseStars.add(star);
//             inUseStars.remove(star);
//           }
//         });
//       },
//       builder: (context, candidateData, rejectedData) {
//         return Container(
//           height: 100,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//           ),
//           child: ListView.builder(
//             itemCount: stars.length,
//             itemBuilder: (context, index) {
//               return Draggable<String>(
//                 data: stars[index],
//                 child: Card(
//                   margin: EdgeInsets.all(8),
//                   color: inUse ? Colors.yellow : Colors.grey,
//                   child: ListTile(
//                     title: Text(stars[index]),
//                   ),
//                 ),
//                 feedback: Card(
//                   margin: EdgeInsets.all(8),
//                   child: ListTile(
//                     title: Text(stars[index]),
//                   ),
//                 ),
//                 childWhenDragging: Container(),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
//
//



// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Gmail Settings',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SettingsPage(),
//     );
//   }
// }
//
// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   List<String> inUseStars = ["Gold", "Blue"];
//   List<String> notInUseStars = ["Red", "Green"];
//
//   List<String> allLanguages = [
//     "Afrikaans",
//     "Azərbaycanca",
//     "Bahasa Indonesia",
//     "Bahasa Melayu",
//     "Català",
//     "Čeština",
//     "Cymraeg",
//     "Dansk",
//     "Deutsch",
//     "Eesti keel",
//     "English",
//     "English (UK)",
//     "English (US)",
//     "Español",
//     "Español (Latinoamérica)",
//     "Euskara",
//     "French",
//     "Filipino",
//     "Français",
//     "Magyar",
//     "Spanish",
//   ];
//
//   List<String> allCountryCode = [
//     "Afghanistan",
//     "Angola",
//     "Australia",
//     "Bangladesh",
//     "Bermuda",
//     "Bhutan",
//     "Brazil",
//     "China",
//     "Cuba",
//     "Denmark",
//     "Dominica",
//     "Egypt",
//     "Estonia",
//     "Finland",
//     "France",
//     "Germany",
//     "Georgia",
//     "Greece",
//     "Hong Kong",
//     "Iceland",
//     "India",
//     "Iran",
//     "Iraq",
//     "Italy",
//     "Japan",
//     "Jordan",
//     "Korea",
//     "Kenia",
//     "Libya",
//     "Mexico",
//     "Nepal",
//     "Span",
//   ];
//
//   List<String> textFormattingOptions = [
//     "Normal",
//     "Bold",
//     "Italic",
//     "Underline",
//   ];
//
//   List<String> textSizeOptions = [
//     "Small",
//     "Normal",
//     "Large",
//     "Huge",
//   ];
//
//   List<String> textColorOptions = [
//     // Colors.black,
//     // Colors.red,
//     // Colors.blue,
//     // Colors.green,
//     // Colors.orange,
//     // Colors.purple,
//     "Black",
//     "Red",
//     "Blue",
//     "Green",
//   ];
//
//
//   String selectedLanguage = "English"; // Default selected language
//   String selectedPhoneNumber = "India"; // Default country code for India
//
//   String defaultText = "This is what your body text will look like.";
//   String selectedTextFormatting = "Normal";
//   String selectedTextSize = "Normal";
//   String selectedTextColor = "Black";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gmail Settings - UI'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 buildSectionTitle("Language : "),
//                 SizedBox(width: 10),
//                 buildLanguageDropdown(),
//               ],
//             ),
//             Row(
//               children: [
//                 buildSectionTitle("Phone numbers : "),
//                 SizedBox(width: 10),
//                 buildPhoneNumberInput(),
//               ],
//             ),
//             buildSectionTitle("Default text : "),
//             buildDefaultTextCard(),
//
//             buildSectionTitle("Stars : "),
//             buildStarsSection(),
//             buildSectionTitle("Signature : "),
//             // Implement Signature UI here
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildDefaultTextCard() {
//     return Card(
//       elevation: 3,
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 buildTextFormattingDropdown(),
//                 buildTextSizeDropdown(),
//                 buildTextColorDropdown(),
//                 buildRemoveFormattingButton(),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               defaultText,
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontSize: getFontSize(selectedTextSize),
//                 color: getColor(selectedTextColor),
//                 decoration: getTextDecoration(selectedTextFormatting),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   double getFontSize(String size) {
//     switch (size) {
//       case "Small":
//         return 12.0;
//       case "Normal":
//         return 16.0;
//       case "Large":
//         return 20.0;
//       case "Huge":
//         return 24.0;
//       default:
//         return 16.0;
//     }
//   }
//
//   Color getColor(String color) {
//     switch (color) {
//       case "Black":
//         return Colors.black;
//       case "Red":
//         return Colors.red;
//       case "Blue":
//         return Colors.blue;
//       case "Green":
//         return Colors.green;
//       default:
//         return Colors.black;
//     }
//   }
//
//   TextDecoration getTextDecoration(String formatting) {
//     switch (formatting) {
//       case "Normal":
//         return TextDecoration.none;
//       // case "Bold":
//       //   return TextDecoration.bold;
//       // case "Italic":
//       //   return TextDecoration.italic;
//       case "Underline":
//         return TextDecoration.underline;
//       default:
//         return TextDecoration.none;
//     }
//   }
//
//
//   Widget buildTextFormattingDropdown() {
//     return DropdownButton<String>(
//       value: selectedTextFormatting,
//       onChanged: (newValue) {
//         setState(() {
//           selectedTextFormatting = newValue!;
//         });
//       },
//       items: textFormattingOptions.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget buildTextSizeDropdown() {
//     return DropdownButton<String>(
//       value: selectedTextSize,
//       onChanged: (newValue) {
//         setState(() {
//           selectedTextSize = newValue!;
//         });
//       },
//       items: textSizeOptions.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget buildTextColorDropdown() {
//     return DropdownButton<String>(
//       value: selectedTextColor,
//       onChanged: (newValue) {
//         setState(() {
//           selectedTextColor = newValue!;
//         });
//       },
//       items:  textColorOptions.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
//
//   //Widget buildTextColorDropdown() {
// //     return Row(
// //       children: [
// //         Text("Text Color: "),
// //         SizedBox(width: 10),
// //         DropdownButton<Color>(
// //           value: selectedTextColor,
// //           onChanged: (newValue) {
// //             setState(() {
// //               selectedTextColor = newValue!;
// //             });
// //           },
// //           items:
// //           [
// //             Colors.black,
// //             Colors.red,
// //             Colors.blue,
// //             Colors.green,
// //             Colors.orange,
// //             Colors.purple,
// //           ]
// //           .map<DropdownMenuItem<Color>>((Color color) {
// //             return DropdownMenuItem<Color>(
// //               value: color,
// //               child: Container(
// //                 width: 20,
// //                 height: 20,
// //                 color: color,
// //               ),
// //             );
// //           }).toList(),
// //         ),
// //       ],
// //     );
// //   }
// //
//
//   Widget buildRemoveFormattingButton() {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           selectedTextFormatting = "Normal";
//           selectedTextSize = "Normal";
//           selectedTextColor = "Black";
//         });
//       },
//       child: const Text("RF"),
//     );
//   }
//
// Widget buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
//
//   Widget buildLanguageDropdown() {
//     return DropdownButton<String>(
//       value: selectedLanguage,
//       onChanged: (newValue) {
//         setState(() {
//           selectedLanguage = newValue!;
//         });
//       },
//       items: allLanguages.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget buildPhoneNumberInput() {
//     return DropdownButton<String>(
//       value: selectedPhoneNumber,
//       onChanged: (newValue) {
//         setState(() {
//           selectedPhoneNumber = newValue!;
//         });
//       },
//       items: allCountryCode.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
//
//
// Widget buildStarsSection() {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("In-use Stars:"),
//               buildStarsList(inUseStars, true),
//             ],
//           ),
//         ),
//         SizedBox(width: 20),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Not-in-use Stars:"),
//               buildStarsList(notInUseStars, false),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildStarsList(List<String> stars, bool inUse) {
//     return DragTarget<String>(
//       onAccept: (star) {
//         setState(() {
//           if (inUse) {
//             inUseStars.add(star);
//             notInUseStars.remove(star);
//           } else {
//             notInUseStars.add(star);
//             inUseStars.remove(star);
//           }
//         });
//       },
//       builder: (context, candidateData, rejectedData) {
//         return Container(
//           height: 100,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//           ),
//           child: ListView.builder(
//             itemCount: stars.length,
//             itemBuilder: (context, index) {
//               return Draggable<String>(
//                 data: stars[index],
//                 child: Card(
//                   margin: EdgeInsets.all(8),
//                   color: inUse ? Colors.yellow : Colors.grey,
//                   child: ListTile(
//                     title: Text(stars[index]),
//                   ),
//                 ),
//                 feedback: Card(
//                   margin: EdgeInsets.all(8),
//                   child: ListTile(
//                     title: Text(stars[index]),
//                   ),
//                 ),
//                 childWhenDragging: Container(),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }