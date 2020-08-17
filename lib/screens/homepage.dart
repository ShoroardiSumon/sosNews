import 'package:flutter/material.dart';
import 'package:sosNews/dataModel/userModel.dart';
import 'package:sosNews/pages/search.dart';
import 'package:sosNews/screens/drawer.dart';
import 'package:sosNews/tabs/homeTab.dart';
import 'package:sosNews/tabs/myNews.dart';
import 'package:sosNews/tabs/photos.dart';
import 'package:sosNews/tabs/topNews.dart';
import 'package:sosNews/tabs/video.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<UserModel> drawerList = new List<UserModel>();

  List _tabname = ["Home", "TopNews", "MyNews", "Photo", "Video"];

  List<Widget> _tabs = [
    HomeTab(),
    TopNews(),
    MyNews(),
    Photos(),
    Video(),
  ];

  @override
  void initState() {
    super.initState();

    drawerList.add(UserModel('Shoroardi Sumon', 'sumonpust@gmail.com',
        'assets/images/user/sumon.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Container(
              width: 122,
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 20,
                    width: 20,
                    child: Text(
                      'S',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment(0, 0),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Container(
                    color: Colors.white,
                    height: 20,
                    width: 20,
                    child: Text(
                      'O',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment(0, 0),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Container(
                    color: Colors.white,
                    height: 20,
                    width: 20,
                    child: Text(
                      'S',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment(0, 0),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Container(
                    child: Text(
                      'NEWS',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            bottom: PreferredSize(
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Top News',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'My News',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Photo',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Video',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(50.0),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(value: 'settings', child: Text('Settings')),
                    PopupMenuItem(value: 'help', child: Text('Help')),
                    PopupMenuItem(value: 'contact', child: Text('Contact us')),
                    PopupMenuItem(
                        value: 'others', child: Text('Other SOS apps')),
                  ];
                },
              ),
            ],
          ),
          drawer: DrawerView(
              drawerList[0].name, drawerList[0].email, drawerList[0].image),
          body: TabBarView(
            children: _tabs,
          )),
    );
  }
}
