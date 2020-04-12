import 'dart:io';
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:album_saver/album_saver.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

// 사용자가 촬영한 사진을 보여주는 위젯

class Previewscreen extends StatelessWidget {

  String imagePath;
  GlobalKey global = GlobalKey();

  Previewscreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        key: global,

       child: Scaffold(
        appBar: AppBar(title: Text('사진 미리보기 화면')),
        // 이미지는 디바이스에 파일로 저장됩니다. 이미지를 보여주기 위해 주어진
        // 경로로 `Image.file`을 생성하세요.

        body: Center(

            child: Column(
                children: <Widget>[
                  Container(width: 399.9, child: Image.file(File(imagePath)),),
                  Container(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [RaisedButton(onPressed: _takeshot,
                      child: Text('사진저장'),),
                        RaisedButton(onPressed: _takeshot2, child: Text('Back'),),
                      ]),),
                  // Container(width:100,child: RaisedButton(onPressed: () {}, child: Text('back'),))
                ]
            ),

        ),
    ),
    );

  }



void _takeshot2() async{
  final directory = await getExternalStorageDirectory();
 var cambox = await new Directory('${directory.path}/cambox').create(recursive: false);
  File img = new File('${cambox.path}/s.png');
  List<int> pg = utf8.encode(imagePath);
  img.writeAsBytes(pg);
  print("save imge ${cambox.path}");
}
  void _takeshot() async {
    print("START CAPTURE");
    var renderObject = global.currentContext.findRenderObject();
    if (renderObject is RenderRepaintBoundary) {
      var boundary = renderObject;
      ui.Image image = await boundary.toImage();
      final directory = await getExternalStorageDirectory();
      var cambox = await new Directory('${directory.path}/cambox').create(recursive: false);
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      File imgFile = new File('${cambox.path}/${DateTime.now()}-cambox.png');
      imgFile.writeAsBytes(pngBytes);
      print("FINISH CAPTURE ${cambox.path}");
    } else {
      print("!");
    }
  }
}





/*void _takePhoto() async {
  ImagePicker.pickImage(source: ImageSource.camera)
      .then((File recordedImage) {
    if (recordedImage != null && recordedImage.path != null) {
      setState(() {
        firstButtonText = 'saving in progress...';
      });
      GallerySaver.saveImage(recordedImage.path, albumName: albumName)
          .then((bool success) {
        setState(() {
          firstButtonText = 'image saved!';
        });
      });
    }
  });
}*/
