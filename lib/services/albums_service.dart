import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_api/models/albums.dart';

String url = "https://jsonplaceholder.typicode.com/albums";

Future<Album> fectAlbum() async{
  
  final response = await http.get(url + "/1");

  if(response.statusCode ==200){
    return Album.fromJson(json.decode(response.body));
  }

  else{
    throw Exception('Fail data to album');
  }
}


Future<List<Album>> getsAlbums() async{
  final response = await http.get(url);

  if(response.statusCode == 200){
    List jsonList = json.decode(response.body);

    return jsonList.map((ablum) => Album.fromJson(ablum)).toList();
  }
  else{
     throw Exception('Fail data to album');
  }
}