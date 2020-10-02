 import 'package:flutter/material.dart';
import './main-drawer.dart';

void main(){
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      drawer:MainDrawer(),
      appBar: AppBar(title: Text(''),backgroundColor: Colors.purple,),
      body: Center(child:
      Center(child: Center(child: Text('Welcome to flutter.',style: TextStyle(fontSize: 42,color:Colors.blueAccent),)))),
      );


  }

}