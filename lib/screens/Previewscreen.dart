import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

// 사용자가 촬영한 사진을 보여주는 위젯

class Previewscreen extends StatelessWidget {
  final String imagePath;

  const Previewscreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('사진 미리보기 화면')),
        // 이미지는 디바이스에 파일로 저장됩니다. 이미지를 보여주기 위해 주어진
        // 경로로 `Image.file`을 생성하세요.

        body: Center(
            child: Column(
                children: <Widget>[
                  Container(width: 399.9, child: Image.file(File(imagePath)),),
                  Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[RaisedButton(onPressed: () {}, child: Text('사진저장'),),
                    RaisedButton(onPressed: () {}, child: Text('Back'),),]),),
                  // Container(width:100,child: RaisedButton(onPressed: () {}, child: Text('back'),))
                ]
            )
          /*child: Image.file(File(imagePath)),
        child: FlatButton(onPressed: () {},child: Text('Save'),))
       ,
      */

        )
    );
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
