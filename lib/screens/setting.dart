import 'package:StampShot/screens/Previewscreen.dart';
import 'package:StampShot/screens/camera.dart';
import 'package:StampShot/screens/stamp.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/src/rendering/object.dart';


final right_text = TextEditingController();
String ri;


class setting extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Setting'),
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisCount: 1,
          mainAxisSpacing: 20,

          children: <Widget>[
            Container(
             height: 50,
            color: Colors.blueGrey,
            child: Container(width: 30, height: 800,
              child:Column(
                children: <Widget>[
                  Text('스탬프 위치 지정', style: TextStyle(fontSize: 40),),

                  TextField(controller: right_text, decoration: InputDecoration(labelText: '가로 위치 입력(-17~285)', labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 3.0))),
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.white),keyboardType: TextInputType.number,
                  ),
                  TextField(decoration: InputDecoration(hintText: '이곳에 세로 사이즈 입력'),),
                  RaisedButton(onPressed: () {}, color: Colors.lightGreenAccent, child: Text('Send'),),
                ],
              )
            ),
            ),
            Container( //스탬프 크기
              width: 100,height: 300,
              color: Colors.purple,
            ),
          ],
        )

    ),
    );

  }
}

//void send_value(BuildContext context) async{
//
//  final cameras = await availableCameras();
//  final firstCamera = cameras.first;
//
//  final na = Navigator.of(context);
//  await na.push(CupertinoPageRoute(builder: (context) =>
//  Cam(r_size: right_text,
//  camera: firstCamera,),)
//    ,);
//  print('오른쪽값:');
//  print(right_text);
//  print(ri);
//
//}