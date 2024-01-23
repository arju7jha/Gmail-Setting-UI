
import 'package:flutter/material.dart';
import 'Stars.dart';
import 'Signature.dart';
import 'DefaultText.dart';
import 'Language.dart';
import 'PhoneNumber.dart';


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
                  const Language(),
                ],
              ),
              Row(
                children: [
                  buildSectionTitle("Phone numbers : "),
                  const SizedBox(width: 10),
                  const PhoneNumbers(),
                ],
              ),
              buildSectionTitle("Default text : "),
              DefaultTextSection(),

              buildSectionTitle("Stars : "),
              StarsSection(),

              buildSectionTitle("Signature : "),
              SignaturesSection(),
            ],
          ),
        ),
      ),
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



}


