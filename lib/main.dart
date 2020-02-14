import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:hiltube/api.dart';
import 'package:hiltube/blocs/videos_bloc.dart';
import 'package:hiltube/screens/home.dart';

void main(){
  Api api = Api();
  api.search("flutter");

  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => VideosBloc())
        ],
      child: MaterialApp(
        title: 'HilTube',
        debugShowCheckedModeBanner: false,
        home: Home(),
      )
    );
  }
}