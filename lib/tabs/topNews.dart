import 'package:flutter/material.dart';
import 'package:sosNews/dataModel/newsModel.dart';
import 'package:sosNews/pages/singleNews.dart';
import 'package:sosNews/pages/singleNews2.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

class TopNews extends StatefulWidget {
  @override
  _TopNewsState createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
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
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: ListView(
        children: <Widget>[
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
        ],
      ),
    );
  }
}
