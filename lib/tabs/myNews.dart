import 'package:flutter/material.dart';
import 'package:sosNews/dataBase/databaseHelper.dart';
import 'package:sosNews/pages/newsDetail.dart';
import 'package:sosNews/screens/homepage.dart';

class MyNews extends StatefulWidget {
  @override
  _MyNewsState createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  final DatabaseHelper databasehelper = DatabaseHelper.instance;
  List<NewsDB> newsdblist;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: databasehelper.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            newsdblist = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: newsdblist.length,
              itemBuilder: (BuildContext context, int index) {
                NewsDB newsdb = newsdblist[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewsDetail(
                              newsdblist[index].newsTitle,
                              newsdblist[index].newsSubtitle,
                              newsdblist[index].newsPhoto,
                              newsdblist[index].newsDescription)));
                    },
                    leading: Image.asset(
                      newsdblist[index].newsPhoto,
                      fit: BoxFit.cover,
                    ),
                    title: Text(newsdblist[index].newsTitle),
                    subtitle: Text(newsdblist[index].newsSubtitle),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          databasehelper.deleteNews(newsdb.id);

                          setState(() {
                            newsdblist.removeAt(index);
                          });
                        }),
                  ),
                );
              },
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add_box,
                    color: Colors.red,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Add Your Favourite News',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        });
  }
}
