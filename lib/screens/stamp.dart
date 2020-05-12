import 'dart:ffi';
import 'dart:io';
import 'package:camera_test/main.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera_test/screens/Previewscreen.dart';
import 'package:camera_test/screens/info.dart';
import 'package:camera_test/screens/stamp.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

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



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  String tempimg;



  Future getImage() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    {
     // Directory tempdir = await getTemporaryDirectory();
      //tempimg = path.join(tempdir.path, path.basename(image.path));

     // print('위치' + tempimg);
      if (image == null) return;
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
      final na = Navigator.of(context);

      // File pi = image;// await ImagePicker.pickImage(source: ImageSource.gallery);


        await na.push(MaterialPageRoute(
            builder: (context) => Previewscreen(stamp: _image.path)));
        print('true');

    }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Picker Example'),actions: <Widget>[
          new IconButton(icon: new Icon(Icons.save), onPressed: _save )],
      ),
      
      body: new Center(
        child: Column(
          children: <Widget>[
            Container(
              child: _image == null
          ? new Text('스탬프로 찍을 이미지를 불러와주세요.')
          : new Image.file(_image) ,width: 300, height: 200.0


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

