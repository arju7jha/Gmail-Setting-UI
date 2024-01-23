import 'package:flutter/material.dart';

class PhoneNumbers extends StatefulWidget {
  const PhoneNumbers({super.key});

  @override
  _PhoneNumbersState createState() => _PhoneNumbersState();
}

class _PhoneNumbersState extends State<PhoneNumbers> {
  String selectedPhoneNumber = "India"; // Default country code for India
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


  @override
  Widget build(BuildContext context) {
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

// ... (Paste the rest of the phone numbers dropdown-related code)
}
