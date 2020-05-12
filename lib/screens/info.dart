import 'dart:async';
import 'dart:ffi';
import 'dart:io';


import 'package:camera_test/screens/Previewscreen.dart';
import 'package:camera_test/screens/stamp.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class info extends StatelessWidget{
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
          padding: EdgeInsets.only(left: 10), child: IconButton(icon: new Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop(null),),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: () => SystemNavigator.pop())
        ],),
        body: Center(
          child: Container(child: Text('만든이: 하원지'))
          //child: Image.file(File(stamp), width: 500))

        ),
      ),
    );
  }
}