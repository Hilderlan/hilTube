import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hiltube/models/video.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteBloc implements BlocBase{
  Map<String, Video> _favorites = {};
  
  final _favoritesController = BehaviorSubject<Map<String, Video>>.seeded({});
  Stream<Map<String, Video>> get outFavorites => _favoritesController.stream;

  FavoriteBloc(){
    SharedPreferences.getInstance().then((prefs){
      if(prefs.getKeys().contains("favorites")){
        _favorites = json.decode(prefs.getString("favorites")).map((k, v){
          return MapEntry(k, Video.fromJason(v));
        }).cast<String, Video>();

        _favoritesController.add(_favorites);
      }
    });
  }

  void toggleFavorites(Video video){
    if(_favorites.containsKey(video.id)){
      _favorites.remove(video.id);
    }
    else{
      _favorites[video.id] = video;
    }

    _favoritesController.sink.add(_favorites);
    _saveFavorites();
  }

  void _saveFavorites(){
    SharedPreferences.getInstance().then((prefs){
      prefs.setString("favorites", json.encode(_favorites));
    });
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    _favoritesController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

  

}