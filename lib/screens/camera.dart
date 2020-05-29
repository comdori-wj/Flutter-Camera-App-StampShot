

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';

import 'package:StampShot/screens/Previewscreen.dart';
import 'package:StampShot/screens/info.dart';
import 'package:StampShot/screens/stamp.dart';
import 'package:StampShot/screens/setting.dart';

import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

// 사용자가 주어진 카메라를 사용하여 사진을 찍을 수 있는 화면
class Camera extends StatefulWidget {


  final stamp2;
  final CameraDescription camera;

  const Camera({ this.camera, @required this.stamp2});



  @override
  CameraState createState() => CameraState();


}

class CameraState extends State<Camera> {

  CameraController _controller;
  
  Future<void> _initializeControllerFuture;


  //카메라가 준비되면 이곳으로 신호를 받는다.

  @override
  void initState() {
    super.initState();
    // 카메라의 현재 출력물을 보여주기 위해 CameraController를 생성합니다.
    _controller = CameraController(
      // 이용 가능한 카메라 목록에서 특정 카메라를 가져옵니다.
      widget.camera,
      // 적용할 해상도를 지정합니다.
      ResolutionPreset.ultraHigh, // 카메라 화질 설정 ultraHigh, high, max
    );

    // 다음으로 controller를 초기화합니다. 초기화 메서드는 Future를 반환합니다.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // 위젯의 생명주기 종료시 컨트롤러 역시 해제시켜줍니다.
    _controller.dispose();
    super.dispose();

  }
var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("StampShot", style: TextStyle(color: Colors.white),),
        elevation: 0, centerTitle: true, iconTheme: IconThemeData(
          color: Colors.amber
      ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.close), onPressed: () => SystemNavigator.pop()),],),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            FlatButton(child: Text("스탬프 사진 불러오기", style: TextStyle(fontSize: 30, color: Colors.deepOrangeAccent),),onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) =>Stamp()),),),
            ListTile(title: Text("워터마크 위치 지정하기", style: TextStyle(fontSize: 28, color: Colors.deepOrangeAccent),),onTap: () => Navigator.push(context,
                CupertinoPageRoute(builder: (BuildContext context) => setting(),),),),
            FlatButton(child: Text("만든이 정보보기", style: TextStyle(fontSize: 40, color: Colors.deepOrangeAccent),), onPressed: ()=> Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) =>info(),),),)


          ],

        ),
      ),
      // 카메라 프리뷰를 보여주기 전에 컨트롤러 초기화를 기다려야 합니다. 컨트롤러 초기화가
      // 완료될 때까지 FutureBuilder를 사용하여 로딩 스피너를 보여주세요.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

            // Future가 완료되면, 프리뷰를 보여줍니다.
            return CameraPreview(_controller);
          } else {
            // 그렇지 않다면, 진행 표시기를 보여줍니다.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: CupertinoButton(
        child: Icon(Icons.camera_alt),
        color: Colors.brown,
        // onPressed 콜백을 제공합니다.
        onPressed: () async {
          // try / catch 블럭에서 사진을 촬영합니다. 만약 뭔가 잘못된다면 에러에
          // 대응할 수 있습니다.
          try {
            // 카메라 초기화가 완료됐는지 확인합니다.
            await _initializeControllerFuture;

            // path 패키지를 사용하여 이미지가 저장될 경로를 지정합니다.
            final path = join(
              // 본 예제에서는 임시 디렉토리에 이미지를 저장합니다. `path_provider`
              // 플러그인을 사용하여 임시 디렉토리를 찾으세요.
              (await getTemporaryDirectory()).path, //getTemporaryDirectory (임시저장) etExternalStorageDirectory)내장저
              '${DateTime.now()}.jpeg',
            );

            // 사진 촬영을 시도하고 저장되는 경로를 로그로 남깁니다.
            await _controller.takePicture(path);
            print('저장위치는:'+path);
           
           // File pickedImage = await ImagePicker.pickImage(source: ImageSource.gallery);

            //File Img = await stamp2.path;
            // 사진을 촬영하면, 새로운 화면으로 넘어갑니다.
             // final aaa = Image.asset('assets/images/py.jpg', width: 30.0);
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Previewscreen(imagePath: path, stamp: widget.stamp2,
                right: rig.text,
                height: hei.text),
              ),
            );
          } catch (e) {
            // 만약 에러가 발생하면, 콘솔에 에러 로그를 남깁니다.
            print(e);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, //플릇버튼의 위치를 지정
    );
  }
}