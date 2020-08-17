import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {

  final String title;
  final String subtitle;
  final String picture;
  final String description;

  NewsDetail(
    this.title,
    this.subtitle,
    this.picture,
    this.description,
  );

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.volume_up),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.share),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.star_border),
              ),
              PopupMenuButton(
                color: Colors.red,
                onSelected: (val){},
              itemBuilder: (BuildContext context){
                return[
                  PopupMenuItem(
                    value: 'fontSize',
                    child: Text('Font Size',style: TextStyle(color: Colors.white),),
                  ),
                  PopupMenuItem(
                    value: 'comment',
                    child: Text('Comment',style: TextStyle(color: Colors.white),)
                  ),
                ];
              },
            ),
            ],
            expandedHeight: 200,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.asset(widget.picture,fit: BoxFit.cover,),
            ),
          ),

          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //Title
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(widget.title, style: TextStyle(fontSize: 22,),)
                ),
                Divider(),   
                //Description
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(widget.description, style: TextStyle(fontSize: 18),),
                ),
              ],
            )
          ),

        ],
      ),
    );
  }
}