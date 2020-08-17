import 'package:flutter/material.dart';
import 'package:sosNews/dataBase/databaseHelper.dart';
import 'package:sosNews/pages/newsDetail.dart';

class SingleNews extends StatefulWidget {
  final String newsTitle;
  final String newsSubtitle;
  final String newsPicture;
  final String newsDescription;

  SingleNews(
    this.newsTitle,
    this.newsSubtitle,
    this.newsPicture,
    this.newsDescription,
  );

  @override
  _SingleNewsState createState() => _SingleNewsState();
}

class _SingleNewsState extends State<SingleNews> {
  NewsDB newsDB;
  DatabaseHelper databaseHelper;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewsDetail(
                        widget.newsTitle,
                        widget.newsSubtitle,
                        widget.newsPicture,
                        widget.newsDescription,
                      )));
            },
            leading: Image.asset(
              widget.newsPicture,
              fit: BoxFit.cover,
            ),
            title: Text(widget.newsTitle),
            subtitle: Text(widget.newsSubtitle),
            trailing: PopupMenuButton(
              onSelected: (val) {
                switch (val) {
                  case 'share':
                    break;
                  case 'save':
                    _saveNews(context);
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      value: 'share',
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.share),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Share',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                  PopupMenuItem(
                    value: 'save',
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.save),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Save',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            )),
      ),
    );
  }

  void _saveNews(BuildContext context) async {
    NewsDB newsDB = NewsDB();
    newsDB.newsTitle = widget.newsTitle;
    newsDB.newsSubtitle = widget.newsSubtitle;
    newsDB.newsPhoto = widget.newsPicture;
    newsDB.newsDescription = widget.newsDescription;
    print(widget.newsTitle);
    print(newsDB);
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insertNews(newsDB);
    print('id row: $id');
  }
}
