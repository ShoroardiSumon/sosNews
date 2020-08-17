import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
//import 'package:photo_view/photo_view_gallery.dart';

class PhotoDetail extends StatefulWidget {
  
  final String photoCaption;
  final String photoSubtitle;
  final String photoLocation;
  final String photoDescription;

  PhotoDetail(
    this.photoCaption,
    this.photoSubtitle,
    this.photoLocation,
    this.photoDescription,
  );

  @override
  _PhotoDetailState createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          ),
          SizedBox(width: 20,),
        ],
      ),

      body: Container(
        child: PhotoView(
          imageProvider: AssetImage(widget.photoLocation),
        ),
      ),

      // body: Container(
      //   child: PhotoViewGallery(
      //     pageOptions: <PhotoViewGalleryPageOptions>[
      //       PhotoViewGalleryPageOptions(
      //         imageProvider: AssetImage(widget.photoLocation),
      //       ),
      //       PhotoViewGalleryPageOptions(
      //         imageProvider: AssetImage('assets/images/nature/pic1.jpg'),
      //       ),
      //       PhotoViewGalleryPageOptions(
      //         imageProvider: AssetImage('assets/images/nature/pic2.jpg'),
      //       ),
      //       PhotoViewGalleryPageOptions(
      //         imageProvider: AssetImage('assets/images/nature/pic3.jpg'),
      //       ),
      //     ],
      //   ),
      // ),
    );

     


  
  }
}