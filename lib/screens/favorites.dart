import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:hiltube/api.dart';
import 'package:hiltube/blocs/favorite_bloc.dart';
import 'package:hiltube/models/video.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Novo jeito de pegar o bloc
    final FavoriteBloc bloc = BlocProvider.getBloc<FavoriteBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("My favorites"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: StreamBuilder<Map<String, Video>>(
        stream: bloc.outFavorites,
        initialData: {},
        builder: (context, snapshot){
          if(snapshot.data.length > 0){
            return ListView(
              children: snapshot.data.values.map((video){
                return InkWell(
                  onTap: (){
                    FlutterYoutube.playYoutubeVideoById(apiKey: API_KEY, videoId: video.id);
                  },
                  onLongPress: (){
                    bloc.toggleFavorites(video);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 50,
                        child: Image.network(video.thumb),
                      ),
                      Expanded(
                        child: Text(
                          video.title,
                          style: TextStyle(color: Colors.white70),
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          }
          else{
            return Center(
              child: Text(
                "Your favorite videos will be shown here!",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        }
      ),
    );
  }
}