import 'package:StampShot/screens/stamp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() =>

  runApp(
    MaterialApp(
      theme: ThemeData.light(), //시스템 기본 설정 테마: 밝은 테마
      darkTheme: ThemeData.dark(), //다크 모드 테마
      home: Stamp( //시작 페이지 - 스탬프 페이지로 이동
      ),
    ),
  );


/*
// runApp 을 호출하기 전에 바인딩을 초기화해야하는 경우에만이 메소드를 호출 하면 됩니다.
  // https://api.flutter.dev/flutter/widgets/WidgetsFlutterBinding/ensureInitialized.html
  WidgetsFlutterBinding.ensureInitialized();

  // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
  final cameras = await availableCameras();

  // 이용가능한 카메라 목록에서 특정 카메라를 얻습니다.
  final firstCamera = cameras.first;
 */



