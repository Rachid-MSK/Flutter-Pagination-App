import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryDataPage extends StatefulWidget {
  String keyword;
  GalleryDataPage(this.keyword);

  @override
  _GalleryDataPageState createState() => _GalleryDataPageState();
}

class _GalleryDataPageState extends State<GalleryDataPage> {
  int currentPage = 1;
  int size = 20;
  List<dynamic> hits;
  var galleryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.keyword),
          backgroundColor: Colors.green,
        ),
        body: (galleryData == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: (galleryData == null ? 0 : hits.length),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width:double.infinity,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Card(
                          child: Padding(padding: EdgeInsets.all(10),
                          child:Center(
                          child: Text(
                            hits[index]['tags'],
                            style: TextStyle(
                                fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold
                            ),

                          ),
                          )
                          ),
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        child: Card(
                          child: Image.network(hits[index]['webformatURL'],
                          fit: BoxFit.fitWidth),
                        ),
                        padding: EdgeInsets.only(left: 10,right: 10,),
                      )
                    ],
                  );
                })));
  }

  getData() {
    String url =
        'https://pixabay.com/api/?key=18547474-681bf176d39f606c500f4b41e&q=${widget.keyword}&page=${currentPage}&per_page=${size}';
    http.get(url).then((resp) {
      setState(() {
        galleryData = json.decode(resp.body);
        hits = galleryData['hits'];
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }
}
