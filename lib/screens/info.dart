import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';


class info extends StatefulWidget {
  @override
  infoState createState() => new infoState();
  }

class infoState extends State<info> {
  infoState({Key key, this.stamp});
  String stamp;
  String appName = "";
  String appID = "";
  String version = "";

  @override
  void initState() {
    super.initState();
    getappinfo();
  }

  void getappinfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appName = packageInfo.appName;
      appID = packageInfo.packageName;
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: new Text('info'),
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(null),
              ),
            ),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.exit_to_app),
                  onPressed: () => SystemNavigator.pop())
            ],
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  color: Colors.tealAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(appName, style: TextStyle(fontSize: 40),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                color: Colors.lime,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("만든이: COMDORI", style: TextStyle(
                              fontSize: 30.5, color: Colors.purple),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                Card(
                  color: Colors.lightGreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("앱버전: "+version, style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Thank you."),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.blueGrey,));
  }
}
