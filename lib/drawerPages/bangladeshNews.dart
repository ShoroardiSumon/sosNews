import 'package:flutter/material.dart';
import 'package:sosNews/dataModel/newsModel.dart';
import 'package:sosNews/pages/singleNews.dart';
import 'package:sosNews/pages/singleNews2.dart';

class BangladeshNews extends StatefulWidget {
  @override
  _BangladeshNewsState createState() => _BangladeshNewsState();
}

class _BangladeshNewsState extends State<BangladeshNews> {
  List<NewsModel> newsModelList = new List<NewsModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bangladesh',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (val) {},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'refresh',
                  child: Text('Refresh'),
                ),
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: newsModelList.length,
        itemBuilder: (BuildContext context, int index) {},
      ),
    );
  }
}
