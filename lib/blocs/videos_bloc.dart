import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hiltube/api.dart';
import 'package:hiltube/models/video.dart';
import 'package:random_words/random_words.dart';

class VideosBloc implements BlocBase{
  Api api;

  List<Video> videos;

  final StreamController<List<Video>> _videosController = StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  // Contructor
  VideosBloc(){
    api = Api();

    String randomWord = generateNoun().take(1).toString();
    _searchController.sink.add(randomWord);
    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    if(search != null){
      _videosController.sink.add([]);
      videos = await api.search(search);
    }
    else{
      videos += await api.nextPage();
    }

    _videosController.sink.add(videos);
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
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