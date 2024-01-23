import 'package:flutter/material.dart';



class SignaturesSection extends StatefulWidget {
  @override
  _SignaturesSectionState createState() => _SignaturesSectionState();
}

class _SignaturesSectionState extends State<SignaturesSection> {
  List<String> signatures = [];


  TextEditingController signatureEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

// ... (Paste the rest of the signature-related code)
}
