import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sosNews/dataModel/newsModel.dart';

class RestDataSource {
  NewsModel _newsModel;

  Future<NewsModel> fetchData() async {
    final response = await rootBundle.loadString('assets/news.json');
    _newsModel = newsModelFromJson(response);
    print(_newsModel.news.nature.length);
    return _newsModel;
  }
}
