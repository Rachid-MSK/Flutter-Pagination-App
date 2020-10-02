import 'package:flutter/material.dart';
import './quiz.dart';
import './weather.dart';
import './gallery.dart';
import'./camera.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child:ListView(children:<Widget> [
      DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:[Colors.deepOrange,Colors.tealAccent])
        ),
        child:Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/Flutter-Framework.png'),
          ),
        ),
      ),
      ListTile(
        title:Text('Quiz',style:TextStyle(fontSize: 30) ),
        onTap:(){
          Navigator.of(context).pop();
          Navigator.push(context,MaterialPageRoute(builder:(context)=>Quiz()));
        },

      ),
      Divider(color: Colors.green),
      ListTile(
        title:Text('Weather',style:TextStyle(fontSize: 30)),
        onTap:(){
          Navigator.of(context).pop();
          Navigator.push(context,MaterialPageRoute(builder:(context)=>Weather()));
        },

      ),
      Divider(color: Colors.green,),
      ListTile(
        title:Text('Gallery',style:TextStyle(fontSize:30)),
        onTap:(){
          Navigator.of(context).pop();
          Navigator.push(context,MaterialPageRoute(builder:(context)=>Gallery()));
        },

      ),

    ],
    )
    );
  }
}
