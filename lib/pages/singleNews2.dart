import 'package:flutter/material.dart';
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
                onSelected: (val) {},
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
}
