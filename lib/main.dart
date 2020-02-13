import 'package:flutter/material.dart';
import 'package:hiltube/api.dart';
import 'package:hiltube/screens/home.dart';

void main(){
  Api api = Api();
  api.search("flutter");

  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HilTube',
      home: Home(),
    );
  }
}