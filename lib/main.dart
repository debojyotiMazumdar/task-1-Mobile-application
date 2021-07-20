//import 'dart:js';
import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'pages/home.dart';
import 'pages/add.dart';
import 'pages/edit.dart';


void main() {
  runApp(MaterialApp(
    //initialRoute: "/edit",
    routes: {
      "/":(context)=>Home(),
      "/add":(context)=>Add(),
      "/edit":(context)=>Edit(),
    },
  ));
}

