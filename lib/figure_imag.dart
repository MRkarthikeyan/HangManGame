import 'package:flutter/material.dart';

Widget FigureImg(bool visible, String path){
  return Visibility(
    visible: visible,
    child: 
  Container(
    height: 300,
    width: 300,
   child: Image.asset(path),
  )
  );
}