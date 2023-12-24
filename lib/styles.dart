import 'package:flutter/material.dart';

InputDecoration customInput(String nama) {
  return InputDecoration(
    labelText: nama,
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: Color(0x6867775C)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
    ),
    contentPadding: EdgeInsets.only(left: 20),
  );
}

ButtonStyle customButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2B637B)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13.0),
    )));
