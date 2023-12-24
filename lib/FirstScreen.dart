import 'package:flutter/material.dart';
import 'package:suitmedia/styles.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();
  String result = "";

  void checkPalindrome() {
    String input = sentenceController.text.replaceAll(" ", "").toLowerCase();
    String reversedInput = input.split('').reversed.join('');
    bool isPalindrome = input == reversedInput;
    result = isPalindrome ? "isPalindrome" : "not palindrome";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //profile picture
                Image.asset(
                  'assets/ic_photo.png',
                  width: 116,
                  height: 116,
                ),
                SizedBox(height: 50), // This will be updated later
                Container(
                  height: 47,
                  child: TextField(
                    controller: nameController,
                    decoration: customInput('Name'),
                  ),
                ),
                SizedBox(height: 20), // This will be updated later
                Container(
                  height: 47,
                  child: TextField(
                    controller: sentenceController,
                    decoration: customInput('Palindrome'),
                  ),
                ),
                SizedBox(height: 40), // This will be updated later
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: checkPalindrome,
                    child: Text(
                      'CHECK',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: customButton,
                  ),
                ),
                SizedBox(height: 15), // This will be updated later
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second', arguments: {
                        'name': nameController.text,
                      });
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: customButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
