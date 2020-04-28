import 'package:flutter/material.dart';
import 'package:json_api/models/albums.dart';
import 'package:json_api/services/albums_service.dart';

class ListAlbumsPage extends StatefulWidget {
  @override
  _ListAlbumsPageState createState() => _ListAlbumsPageState();
}

class _ListAlbumsPageState extends State<ListAlbumsPage> {
  Future<List<Album>> future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = getsAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET Albums"),
      ),
      body: Center(
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Album> data = snapshot.data;

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(data[index].title),
                    ),
                  );
                },
              );
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
