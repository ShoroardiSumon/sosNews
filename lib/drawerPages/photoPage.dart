import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sosNews/dataModel/newsModel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

import 'package:sosNews/pages/photoDetail.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final List<String> photoCategory = [
    "Bangladesh",
    "Sports",
    "International",
    "Islamic",
    "Entertainment",
    "Science & Technology",
    "Fashion",
  ];

  NewsModel _newsModel;

  Future<NewsModel> fetchData() async {
    final response = await rootBundle.loadString('assets/news.json');
    _newsModel = newsModelFromJson(response);
    print(_newsModel.news.nature.length);
    return _newsModel;
  }

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Photos',
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
      body: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              height: 50,
              padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: photoCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 0,
                        onPressed: () {
                          _onSelected(index);
                        },
                        child: Text(photoCategory[index]),
                        textColor:
                            _selectedIndex != null && _selectedIndex == index
                                ? Colors.white
                                : Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: _selectedIndex != null && _selectedIndex == index
                            ? Colors.red
                            : Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  );
                },
              ),
            ),
            FutureBuilder(
              future: fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return StaggeredGridView.countBuilder(
                      primary: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: _selectedIndex == 0
                          ? _newsModel.news.nature.length
                          : _selectedIndex == 1
                              ? _newsModel.news.sports.length
                              : _newsModel.news.international.length,
                      itemBuilder: (context, index) => Container(
                            height: index.isEven ? 190 : 290,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PhotoDetail(
                                          _selectedIndex == 0
                                              ? _newsModel
                                                  .news.nature[index].title
                                              : _selectedIndex == 1
                                                  ? _newsModel
                                                      .news.sports[index].title
                                                  : _newsModel
                                                      .news
                                                      .international[index]
                                                      .title,
                                          _selectedIndex == 0
                                              ? _newsModel
                                                  .news.nature[index].subtitle
                                              : _selectedIndex == 1
                                                  ? _newsModel.news
                                                      .sports[index].subtitle
                                                  : _newsModel
                                                      .news
                                                      .international[index]
                                                      .subtitle,
                                          _selectedIndex == 0
                                              ? _newsModel
                                                  .news.nature[index].picture
                                              : _selectedIndex == 1
                                                  ? _newsModel.news
                                                      .sports[index].picture
                                                  : _newsModel
                                                      .news
                                                      .international[index]
                                                      .picture,
                                          _selectedIndex == 0
                                              ? _newsModel.news.nature[index]
                                                  .description
                                              : _selectedIndex == 1
                                                  ? _newsModel.news
                                                      .sports[index].description
                                                  : _newsModel
                                                      .news
                                                      .international[index]
                                                      .description,
                                        )));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  height: index.isEven ? 190 : 290,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        _selectedIndex == 0
                                            ? _newsModel
                                                .news.nature[index].picture
                                            : _selectedIndex == 1
                                                ? _newsModel
                                                    .news.sports[index].picture
                                                : _newsModel
                                                    .news
                                                    .international[index]
                                                    .picture,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(1));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
