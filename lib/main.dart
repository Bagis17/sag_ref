/*import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _controller = ScreenshotController();

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  Future<void> shareFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null || result.files.isEmpty) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: result.files[0] as String,
    );
  }

  Future<void> shareScreenshot() async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    final String localPath =
        '${directory!.path}/${DateTime.now().toIso8601String()}.png';

    await _controller.captureAndSave(localPath);

    await Future.delayed(Duration(seconds: 1));

    await FlutterShare.shareFile(
        title: 'Compartilhar comprovante',
        filePath: localPath,
        fileType: 'image/png'
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Screenshot(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: Text('Share text and link'),
                  onPressed: share,
                ),
                TextButton(
                  child: Text('Share local file'),
                  onPressed: shareFile,
                ),
                TextButton(
                  child: Text('Share screenshot'),
                  onPressed: shareScreenshot,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/


import 'package:flutter/material.dart';
import 'package:sag_ref/form.dart';
import 'package:sag_ref/list.dart';
import './testqrcode.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './accueil.dart';
import 'package:logger/logger.dart';
import './inscription.dart';
import './login.dart';
void main() {
  runApp(Home(1,-1));
}

class Home extends StatefulWidget {
  int state;
  int id;
  Home(this.state,this.id) ;

  @override
  _HomeState createState() => _HomeState(this.state,this.id);
}
class _HomeState extends State<Home> {
  final log=Logger();
  int state;
  int id;
  int _indexCourant=-1;
  late Widget _body;
  late String _title;
  _HomeState(this.state,this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changerDePage(state);
  }

  void _boutonClique(index){
    log.i("aaaaaaaaaaaaaaaandex cliqué : $index");
    changerDePage(index);
  }

  void changerDePage(index){
    log.i("Izzzzzzzzzzzzzzzzzzzzzzzzzzzndex cliqué : $_indexCourant");
    setState(() {
      //log.i("Izzzzzzzzzzzzzzzzzzzzzzzzzzzndex cliqué : $index");
      if(id==-1)
        {
          _title="First Time";
          _body=SplashScreen(title: "Accueil");
        }else
        {
          switch(index){
            case 0:{
              _title="List";
              _body=ProductsList();
              break;
            }
          /*case -1:{
          _title="First Time";
          _body=SplashScreen(title: "Accueil");
          break;
        }*/
            case 1:{
              _title="Home";
              _body=LoginPage();
              break;
            }
            case 2:{
              _title="Form";
              _body=ProductForm(this.id);
              break;
            }
          }
        }
    });
    _indexCourant=index;


  }

  @override
  Widget build(BuildContext context){

    final items=<Widget>[
      Icon(Icons.format_list_bulleted),
      Icon(Icons.home ),
      Icon(Icons.add)
    ];
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:Row(
            children: [
              Image.asset("images/logo.png",
                width: 80,
                height: 60,
                alignment: Alignment.centerLeft,
              ),
             // Text(_title)
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(left: 100.0),
                child:Text("Sa Gestion",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ),
        body:_body,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(
              color: Colors.white,
            )
          ),
          child: CurvedNavigationBar(
            color: Colors.black ,
            buttonBackgroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            items: items,
            index: _indexCourant,
            onTap: _boutonClique,

          ),
        ),
      ),
    );
  }
}
/*

selectedLabelStyle: const TextStyle(
            color:Colors.purple
          ),
          selectedItemColor: Colors.purple,
          items: const [
           BottomNavigationBarItem(
               icon:Icon(Icons.format_list_bulleted,color: Colors.pinkAccent),
               title: Text("Products"/*,style: TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.green,
             )*/
              ),
             activeIcon: Icon(
               Icons.format_list_bulleted,
               color: Colors.purple,
             ),
           ),
            BottomNavigationBarItem(
              icon:Icon(Icons.home,color: Colors.pinkAccent ),
              title:Text("Home"),activeIcon: Icon(
              Icons.home,
              color: Colors.purple,
            ),),
            BottomNavigationBarItem(
                icon:Icon(Icons.add,color: Colors.pinkAccent),
                title:Text("Add"),
                activeIcon: Icon(
                Icons.add,
                color: Colors.purple,
              ),
            )
          ],
          currentIndex: _indexCourant,

 */