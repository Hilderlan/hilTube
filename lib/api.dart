import 'dart:convert';

import 'package:hiltube/models/video.dart';
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyBRrpr2kwm662jjhSnH-4OyoFjK4slhRR8";

class Api{
  search(String search) async {
    http.Response response = await http.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10");

    decode(response);
  }

  List<Video> decode(http.Response response){
    if(response.statusCode == 200){
      var decoded = json.decode(response.body);

      List<Video> videos = decoded["items"].map<Video>(
        (map){
          return Video.fromJason(map);
        }
      ).toList();

      print(videos);
      return videos;
    }
    else{
      throw Exception("Failed to load videos");
    }
  }
}
