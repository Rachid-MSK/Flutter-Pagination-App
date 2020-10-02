import 'package:flutter/material.dart';
import './gallery-data-page.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyword="";
  TextEditingController textEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,title: Text(keyword),
        ),
        body: Column(
          children: [
            Container(
                child: TextField(
                  controller: textEditingController,
                  style: TextStyle(fontSize: 30),
                  onChanged: (value){
                    setState(() {
                      this.keyword=value;
                    });
                  },
                  onSubmitted: (value){
                    //la validation du button.
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDataPage(keyword)));
                    //pour la suppression automatique du text quand on veut retourner vers le textbox pour saisir une vilee.
                    textEditingController.text="";
                  },
                ),
                padding: EdgeInsets.all(10)),
            Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    //la validation du button.
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDataPage(keyword)));
                    //pour la suppression automatique du text quand on veut retourner vers le textbox pour saisir une vilee.
                    textEditingController.text="";

                  },

                padding: EdgeInsets.all(10),
                color: Colors.redAccent,
                child: Text(
                  'Get Info',
                  style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),
                 ),
                )),
          ],
        ));
  }
}
