import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:StampShot/screens/Previewscreen.dart';
import 'package:StampShot/screens/stamp.dart';

import 'package:flutter/services.dart';

class info extends StatelessWidget {
  String stamp;

  info({Key key, this.stamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: new Text('info'),
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.exit_to_app),
              onPressed: () => SystemNavigator.pop())
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[ Card(

            color: Colors.lime,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("만든이: 하원지",style: TextStyle(fontSize: 30.5, color: Colors.purple),),
                    ],
                  ),
                ),
              ],
            ),
          ),
            Card(
              color: Colors.lightGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("애플리케이션 버전: 2.0ver"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Thank you."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    backgroundColor: Colors.blueGrey,));
  }
}
