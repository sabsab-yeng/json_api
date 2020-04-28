import 'package:flutter/material.dart';
import 'package:json_api/ui/album_page.dart';

import 'list_album.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json api"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              RaisedButton(
                child: Text("Get Album"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AlbumPage()));
                },
              ),
              SizedBox(height: 20,),
               RaisedButton(
                child: Text("Get Albums"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ListAlbumsPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
