import 'dart:io';
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';
import 'dart:wasm';

import 'package:camera_test/main.dart';
import 'package:camera_test/screens/stamp.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';


// 사용자가 촬영한 사진을 보여주는 위젯

class Previewscreen extends StatelessWidget {


  //_Mainpage(BuildContext context) => Navigator.pop(null);  //메인페이지로 이동하는 클래스 push-새로운 화면, pop-이전 화면 복귀
  final imagePath;
  File stamp;

  GlobalKey global = GlobalKey();
  BuildContext ctx;
    Previewscreen({Key key, this.imagePath, this.stamp}) : super(key: key);
 // var fileContent = stamp.readAsBytesSync();
//  var fileContentBase64 = base64.encode(stamp);

/*   _getImage(BuildContext context) async{

    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      _image = image;
      Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Previewscreen(_image.path, _image),
        ),
      );
    }
   else{
     print('error');
    }

  }*/

/*void _img(BuildContext context) async{
  if(_image != null){
   stamp = _image as String;
  }

}*/


  @override
  Widget build(BuildContext context) {
    ctx = context;


    return Scaffold(
      appBar: AppBar(title: Text('사진 미리보기')),
      // 이미지는 디바이스에 파일로 저장됩니다. 이미지를 보여주기 위해 주어진 경로로 `Image.file`을 생성하세요.

      body: Center(

        child: Column(
            children: <Widget>[

              Container(),
              RepaintBoundary(
                  key: global,
                  child: new Stack(children: <Widget>[
                    Container(width: 370.8,  child: Image.file(File(imagePath)),), //사진
                    Positioned(child:

                    stamp == null
                        ? new Image.asset('assets/images/kakao.jpg', width: 500)
                        : new Image.file(stamp), width: 100,  // Positioned(child: Image.asset('assets/images/kakao.jpg', width: 100),
                      right: 3,
                      height: 100,
                    ), //스탬프 위치
                  ],)),
              // Container(width: 399.9, child: Image.file(File(imagePath)),  ),
              //CircleAvatar(radius: 50.0, backgroundColor: Colors.<em>red</em>,),

              Container(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(onPressed: _takeshot,
                      child: Text('사진저장'),
                    ),
                    RaisedButton(child: Text('Back'), onPressed: () { Navigator.pop(context); //뒤로가기
     }),
                    RaisedButton(child: Text('stamp'), onPressed: null)
                  ]),),
              // Container(width:100,child: RaisedButton(onPressed: () {}, child: Text('back'),))
            ]
        ),

      ),

    );

  }





  void _takeshot2() async {
    final directory = await getExternalStorageDirectory();
    var cambox = await new Directory('${directory.path}/StampShot').create(
        recursive: false);
    File img = new File('${cambox.path}/s.png');
    /*ByteData byteData = await imagePath.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData.buffer.asUint8List();
  List<int> pg = utf8.encode(imagePath);
  img.writeAsBytes(pg);
  print("save imge ${cambox.path}");*/
  }

   void _takeshot() async {
    /*var renderObject = global.currentContext.findRenderObject();
    if (renderObject is RenderRepaintBoundary) {
      var boundary = renderObject;*/ //이걸써도 되고 아니면 아래 구문을 써도 좋다.

    try {
      RenderRepaintBoundary boundary = global.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage();
      final directory = await getExternalStorageDirectory();
      var stampshot = await new Directory('${directory.path}/StampShot').create(
          recursive: false);
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      File imgFile = new File('${stampshot.path}/${DateTime.now()}-StampShot.png');
      imgFile.writeAsBytes(pngBytes);
      Fluttertoast.showToast(
          msg: "사진은 갤러리 및 사진앱에서 확인하거나 \n ${directory.path}/StampShot서 확인가능 합니다.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 17.0);
      print("캡쳐 완료 ${stampshot.path}");


    }
    catch (e) {
      print(e);
    }
  }
}


/*else {
      NullThrownError e;
      print(e);
    }
  }
}


*/


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
}

 */