import 'package:flutter/material.dart';
import 'package:suitmedia/styles.dart';
import 'package:suitmedia/ThirdScreen.dart';

class SecondScreen extends StatefulWidget {
  final String name;

  SecondScreen({required this.name});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserNameText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: TextStyle(fontSize: 12)),
            Text(
              widget.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                selectedUserNameText.isNotEmpty
                    ? '$selectedUserNameText'
                    : 'Selected User Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 41,
                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedUserName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThirdScreen()));
                      if (selectedUserName != null) {
                        setState(() {
                          selectedUserNameText = selectedUserName;
                        });
                      }
                    },
                    child: Text(
                      'Choose a User',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: customButton,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
