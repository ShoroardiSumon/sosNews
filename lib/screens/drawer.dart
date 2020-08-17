import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:sosNews/drawerPages/art_literatureNews.dart';
import 'package:sosNews/drawerPages/bangladeshNews.dart';
import 'package:sosNews/drawerPages/economicNews.dart';
import 'package:sosNews/drawerPages/educationalNews.dart';
import 'package:sosNews/drawerPages/entertainmentNews.dart';
import 'package:sosNews/drawerPages/internationalNews.dart';
import 'package:sosNews/drawerPages/lifeStyleNews.dart';
import 'package:sosNews/drawerPages/opinion.dart';
import 'package:sosNews/drawerPages/science_TechNews.dart';
import 'package:sosNews/drawerPages/sportsNews.dart';

class DrawerView extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userImage;

  DrawerView(
    this.userName,
    this.userEmail,
    this.userImage,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          ResponsiveContainer(
            heightPercent: 28,
            widthPercent: 100,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                userName,
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage(userImage),
              ),
            ),
          ),
          ResponsiveContainer(
              heightPercent: 72,
              widthPercent: 100,
              child: ListView(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BangladeshNews()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Bangladesh',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InternationalNews()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'International',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SportsNews()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Sports',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EntertainmentNews()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Entertainment',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EducationalNews()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Educational',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EconomicNews()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Economic',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SceinceTechNews()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Science & Technology',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LifeStyleNews()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Life Style',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ArtLiteratureNews()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Art & Literature',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Opinion()));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Opinion',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Feature',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    initiallyExpanded: false,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Aaaaa',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Bbbbb',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Ccccc',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Ddddd',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Eeeee',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Fffff',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Ggggg',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Hhhhh',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
