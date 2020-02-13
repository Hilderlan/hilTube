import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 80.0,
          child: Image.asset("images/youtube_PNG22.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: (){

            }
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            }
          ),
        ],
      ),
    );
  }
}