import 'package:flutter/material.dart';


Widget letter(String words, bool hidden) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 225, 226, 226),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Visibility(
        visible: !hidden,
        child:Center(
          child: Text(words,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
          ),
        ),
      ),
    ),
  );
  }