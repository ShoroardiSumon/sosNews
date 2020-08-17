import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search topics and articles',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20,left: 20),
            child: Text('In The News Now',style: TextStyle(fontSize: 15, color: Colors.blueGrey,)),
          )
        ],
      )
    );
  }
}