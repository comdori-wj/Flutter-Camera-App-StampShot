import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera_test/screens/camera.dart';

import 'package:camera/camera.dart';

/*class stamp extends StatelessWidget {
  @override
  _stamppage createState() => _stamppage();
}


class _stamppage extends State<stamp> {
  File mphoto;

  @override
  Widget build(BuildContext context) {
    Widget photo = (mphoto != null) ? Image.file(mphoto) : Text('사진이 없음');
    // TODO: implement build
    return Container(

    )
  }


}*/


class Stamp extends StatefulWidget {
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

    void _save() async {
      WidgetsFlutterBinding.ensureInitialized();

      final cameras = await availableCameras();  // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
      final firstCamera = cameras.first; // 이용가능한 카메라 목록에서 특정 카메라를 얻습니다.

      final na = Navigator.of(context);

      // File pi = image;// await ImagePicker.pickImage(source: ImageSource.gallery);


        await na.push(MaterialPageRoute(
            builder: (context) => Cam(
                stamp2: _image,
                camera: firstCamera,
            )));
        print('true:');


    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('★도장 사진 불러오기★'),actions: <Widget>[
          new IconButton(icon: new Icon(Icons.save), onPressed: _save )],
      ),
      
      body: new Center(
        child: Column(
          children: <Widget>[
            Container(
              child: _image == null
          ? new Text('스탬프로 찍을 이미지를 불러와주세요.', style: TextStyle(fontSize: 35, color: Colors.cyan),)
          : new Image.file(_image) ,width: 380, height: 500.0

            )
          ],
        )

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: new Icon(Icons.photo_size_select_large),
      ),
    );
  }
}
