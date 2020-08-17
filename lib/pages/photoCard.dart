import 'package:flutter/material.dart';
import 'package:sosNews/pages/photoDetail.dart';

class PhotoCard extends StatelessWidget {
  final String picTitle;
  final String picSubtitle;
  final String picLocation;
  final String picDescription;

  PhotoCard(
    this.picTitle,
    this.picSubtitle,
    this.picLocation,
    this.picDescription,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PhotoDetail(
                    picTitle, picSubtitle, picLocation, picDescription)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 1,
                width: 160,
                color: Colors.black54,
              ),
              Container(
                height: 2,
                color: Colors.white,
              ),
              Container(
                height: 1,
                width: 165,
                color: Colors.black54,
              ),
              Container(
                height: 2,
                color: Colors.white,
              ),
              Image.asset(
                picLocation,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  picTitle,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
