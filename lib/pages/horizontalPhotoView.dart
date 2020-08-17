import 'package:flutter/material.dart';
import 'package:sosNews/pages/photoDetail.dart';

class HorizontalPhotoView extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picture;
  final String description;

  HorizontalPhotoView({
    this.title,
    this.subtitle,
    this.picture,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                PhotoDetail(title, subtitle, picture, description)));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3.0),
              height: 135,
              width: 240,
              child: Image.asset(
                picture,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 240,
              padding: EdgeInsets.all(5.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: 240,
              padding: EdgeInsets.all(5.0),
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
