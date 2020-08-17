import 'package:flutter/material.dart';
import 'package:sosNews/dataModel/newsModel.dart';
import 'package:sosNews/pages/photoCard.dart';

class BangladeshPhotos extends StatefulWidget {
  @override
  _BangladeshPhotosState createState() => _BangladeshPhotosState();
}

class _BangladeshPhotosState extends State<BangladeshPhotos> {
  List<NewsModel> newsModelList = new List<NewsModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: newsModelList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          // return PhotoCard(

          // );
        });
  }
}
