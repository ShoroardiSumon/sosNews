import 'package:flutter/material.dart';
import 'package:sosNews/dataModel/newsModel.dart';
import 'package:sosNews/drawerPages/internationalNews.dart';
import 'package:sosNews/drawerPages/sportsNews.dart';
import 'package:sosNews/pages/horizontalPhotoView.dart';
import 'package:sosNews/pages/singleNews.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sosNews/pages/singleNews2.dart';
import 'dart:async';

import 'package:sosNews/tabs/photos.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder(
              future: fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: _newsModel.news.nature.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      if (index != 0) {
                        return SingleNews(
                            _newsModel.news.nature[index].title,
                            _newsModel.news.nature[index].subtitle,
                            _newsModel.news.nature[index].picture,
                            _newsModel.news.nature[index].description);
                      } else
                        return SingleNews2(
                            _newsModel.news.nature[index].title,
                            _newsModel.news.nature[index].subtitle,
                            _newsModel.news.nature[index].picture,
                            _newsModel.news.nature[index].description);
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),

          SizedBox(
            height: 20.0,
          ),

          // Horizontal Photo view
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.red,
                  height: 20,
                  width: 4,
                ),
              ),
              Text(
                'PHOTOS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Container(
            height: 210,
            child: FutureBuilder(
              future: fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _newsModel.news.nature.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index != _newsModel.news.nature.length) {
                        return HorizontalPhotoView(
                          title: _newsModel.news.nature[index].title,
                          subtitle: _newsModel.news.nature[index].subtitle,
                          picture: _newsModel.news.nature[index].picture,
                          description:
                              _newsModel.news.nature[index].description,
                        );
                      } else
                        return Container(
                            width: 150,
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Photos()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                    Text('More',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )));
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),

          SizedBox(
            height: 20.0,
          ),

          // Sports Card
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.red,
                  height: 20,
                  width: 4,
                ),
              ),
              Text(
                'SPORTS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Container(
            child: FutureBuilder(
              future: fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: _newsModel.news.sports.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      if (index != 0) {
                        return SingleNews(
                            _newsModel.news.sports[index].title,
                            _newsModel.news.sports[index].subtitle,
                            _newsModel.news.sports[index].picture,
                            _newsModel.news.sports[index].description);
                      } else
                        return SingleNews2(
                            _newsModel.news.sports[index].title,
                            _newsModel.news.sports[index].subtitle,
                            _newsModel.news.sports[index].picture,
                            _newsModel.news.sports[index].description);
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Container(
            child: Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'More Sports News',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SportsNews()));
                      })
                ],
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),

          // International news
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.red,
                  height: 20,
                  width: 4,
                ),
              ),
              Text(
                'INTERNATIONAL',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Container(
            child: FutureBuilder(
              future: fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: _newsModel.news.international.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      if (index != 0) {
                        return SingleNews(
                            _newsModel.news.international[index].title,
                            _newsModel.news.international[index].subtitle,
                            _newsModel.news.international[index].picture,
                            _newsModel.news.international[index].description);
                      } else
                        return SingleNews2(
                            _newsModel.news.international[index].title,
                            _newsModel.news.international[index].subtitle,
                            _newsModel.news.international[index].picture,
                            _newsModel.news.international[index].description);
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Container(
            child: Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'More International News',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InternationalNews()));
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
