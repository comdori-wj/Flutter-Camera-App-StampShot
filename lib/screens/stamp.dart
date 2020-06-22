import 'dart:io';
import 'dart:async' show Future;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:StampShot/screens/camera.dart';

import 'package:camera/camera.dart';
import 'package:flutter/src/rendering/object.dart';

import 'package:flutter/services.dart' show rootBundle;

import 'package:path_provider/path_provider.dart';



class Stamp extends  StatefulWidget {
  @override
  _StampPageState createState() => new _StampPageState();

}

class _StampPageState extends State<Stamp> {

  File _image; //이미지 불러오는 변수
  Future getImage() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);

      if (image != null){
        print('위치'+image.path);

      //final String path = await getApplicationDocumentsDirectory().path;
      setState(() {
        _image = image;
      });

      /* final na = Navigator.of(context);
      await na.push(MaterialPageRoute(
          builder: (context) => MyAPP(stamp: image.path)));*/
    }
  }

//  Future<File> getImageFileFromAssets(String path) async {
//    final byteData = await rootBundle.load('assets/images/py.png');
//
//    final file = File('${(await getTemporaryDirectory()).path}/$path');
//    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//
//    return file;
//  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('★도장 사진 불러오기★'),actions: <Widget>[
          new IconButton(icon: new Icon(Icons.save), onPressed: _save )],
      ),
      
      body: new Center(
        child: new Column(
          children: <Widget>[
            Container(
              child: _image == null
          ? new Text('\n스탬프로 찍을 이미지를 불러와주세요. \n\n이미지를 선택하지 않았을경우 임시 스탬프 이미지가 넣어집니다.', style: TextStyle(fontSize: 28.8, color: Colors.cyan),)
          : new Image.file(_image) ,width: 380, height: 480.0,


            ),
            new Container(height: 5,),
            new CupertinoButton(onPressed: getImage, child: new Icon(Icons.add_photo_alternate), color: Colors.blueGrey,  ),
            new Container(height: 3,),
//            new Text('예제 스탬프'),
//            new Container(
//
//              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
//              height: 150,
//
//              child: new ListView(
//                shrinkWrap: false,
//                scrollDirection: Axis.horizontal,
//                children: <Widget>[
//                  CupertinoButton(
//                    onPressed: _stamp1,
//                    child: new Image.asset('assets/images/py.png'),
//                    minSize: 0,
//                    color: Colors.white,
//
//                  ),
//                  MaterialButton(
//                    child: new Image.asset('assets/images/goodjob.png'),
//                    onPressed: () {},
//                    color: Colors.lightGreen,
//                  ),
//                  Container(
//                    width: 100,
//                    color: Colors.white,
//                  ),
//                  Container(
//                    width: 100,
//                    color: Colors.orange,
//                  ),
//                  Container(
//                    width: 100,
//                    color: Colors.lightGreen,
//                  )
//                ],
//              ),
//            )
          ],

        ),


      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: getImage,
//        tooltip: 'Pick Image',
//        child: new Icon(Icons.photo_size_select_large),
//      ),
    );
  }
  void _save() async {
    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();  // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
    final firstCamera = cameras.first; // 이용가능한 카메라 목록에서 특정 카메라를 얻습니다.

    final na = Navigator.of(context);

    // File pi = image;// await ImagePicker.pickImage(source: ImageSource.gallery);


    await na.push(MaterialPageRoute(
        builder: (context) => Camera(
          stamp2: _image,
          camera: firstCamera,

        )));

  }
  void _stamp1() async {



    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();  // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
    final firstCamera = cameras.first; // 이용가능한 카메라 목록에서 특정 카메라를 얻습니다.

    final na = Navigator.of(context);

    //File a1 = await getImageFileFromAssets('assets/images/py.png');
    // File pi = image;// await ImagePicker.pickImage(source: ImageSource.gallery);


    await na.push(MaterialPageRoute(
        builder: (context)=> Camera(
          stamp2: ImagePicker.pickImage(source: ImageSource.gallery),//getImageFileFromAssets('assets/images/py.png'),
          camera: firstCamera,

        )));

  }

}


