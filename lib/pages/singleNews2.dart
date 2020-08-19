import 'package:flutter/material.dart';
import 'package:sosNews/dataBase/databaseHelper.dart';
import 'package:sosNews/pages/newsDetail.dart';

class SingleNews2 extends StatefulWidget {
  final String newsTitle;
  final String newsSubtitle;
  final String newsPicture;
  final String newsDescription;

  SingleNews2(
    this.newsTitle,
    this.newsSubtitle,
    this.newsPicture,
    this.newsDescription,
  );

  @override
  _SingleNews2State createState() => _SingleNews2State();
}

class _SingleNews2State extends State<SingleNews2> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NewsDetail(
                  widget.newsTitle,
                  widget.newsSubtitle,
                  widget.newsPicture,
                  widget.newsDescription)));
        },
        child: Stack(
          children: <Widget>[
            Image.asset(
              widget.newsPicture,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.black54,
                height: 75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.newsTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      widget.newsSubtitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 140,
              right: 15,
              child: PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onSelected: (val) {
                  switch (val) {
                    case "share":
                      break;
                    case "save":
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
                        )),
                  ];
                },
              ),
            ),
          ],
        ),
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
