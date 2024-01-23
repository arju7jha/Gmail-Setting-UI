import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String selectedLanguage = "English"; // Default selected language

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


  @override
  Widget build(BuildContext context) {
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
// ... (Paste the rest of the language dropdown-related code)
}
