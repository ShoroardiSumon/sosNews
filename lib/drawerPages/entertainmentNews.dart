import 'package:flutter/material.dart';

class EntertainmentNews extends StatefulWidget {
  @override
  _EntertainmentNewsState createState() => _EntertainmentNewsState();
}

class _EntertainmentNewsState extends State<EntertainmentNews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Entertainment',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (val) {},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'refresh',
                  child: Text('Refresh'),
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Image.asset("assets/images/sports/spo1.jpg"),
                title: Text("Entertainment"),
                subtitle: Text('Entertainment News'),
                trailing: PopupMenuButton(
                  onSelected: (val) {
                    switch (val) {
                      case 'share':
                        break;
                      case 'save':
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
