import 'package:flutter/material.dart';
import 'package:json_api/models/albums.dart';
import 'package:json_api/services/albums_service.dart';

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  Future<Album> future;

  @override
  void initState() {
    super.initState();
    future = fectAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Album"),
      ),
      body: Center(
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator(
              backgroundColor: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
