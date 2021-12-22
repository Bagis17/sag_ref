//import 'dart:js';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr/qr.dart';
import 'package:share/share.dart';
import 'dart:io';

ScreenshotController screenshotController = ScreenshotController();
/*
Future<void> _captureAndSharePng() async {
  screenshotController.capture().then((File image1) async {
    //Capture Done
    List<int> bytes1 = await image1.readAsBytes();

    await Share.file("Code",
        'title' + ".jpg", bytes1, 'image/jpg',
        text: "Join Group by scanning this code"
    );
  }).catchError((onError) {
    print(onError);
  });
}
*/
/*
Future<void> shareScreenshot() async {
  Directory? directory;
  if (Platform.isAndroid) {
    directory = await getExternalStorageDirectory();
  } else {
    directory = await getApplicationDocumentsDirectory();
  }
  final String localPath =
      '${directory!.path}/${DateTime.now().toIso8601String()}.png';

  await screenshotController.captureAndSave(localPath);

  await Future.delayed(Duration(seconds: 1));

  await FlutterShare.shareFile(
      title: 'Compartilhar comprovante',
      filePath: localPath,
      //fileType: 'image/png'
  );
}
*/
Widget qrCode(productName){


  return MaterialApp(
      home: Scaffold(
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
        ),body: Container(
          padding: EdgeInsets.all(16),
          width: 800,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//Image.asset("images/pomme.jpg"),
              Container(


                //child: Center(
                  child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Screenshot(
                      controller: screenshotController,
                      child: QrImage(
                        data: "Number :",
                        version: QrVersions.auto,
                        size: 200.0,
                        //backgroundColor: Colors.black,
                      ),
                    ),
                /*    Text("Tu peux exporter",style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14
                    ),),*/
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child:
                      InkWell(
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0,20.0),
                                blurRadius: 30.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 110,
                                padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                                child: Text("Telecharger", style: TextStyle(
                                  //fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(95.0),
                                    bottomRight: Radius.circular(200.0),
                                    topLeft: Radius.circular(95.0),
                                  )
                                ),
                              ),
                              Icon(Icons.cloud_download ),


                              /*MaterialButton(onPressed: (){},//_captureAndSharePng,
                                  color: Colors.black,
                                  textColor: Colors.white,
                                  child:
                              ),*/

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //),
              ),
//Image.asset("images/pomme.jpg", width: 27, height: 30,),
/*Image(
          image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.lactualite.com%2F2014%2F08%2Fbanane.jpg&imgrefurl=https%3A%2F%2Flactualite.com%2Fsante-et-science%2Fune-banane-dopee%2F&tbnid=Pjal_88xeGctnM&vet=12ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ..i&docid=y5MWgtOihGqL2M&w=600&h=450&itg=1&q=banane&ved=2ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ'),
          width: 27,
          height: 30,
        ),*/
            ],
          ),
        ),
      )
  );

}
/*return Container(
padding: EdgeInsets.all(16),
width: 800,
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
//Image.asset("images/pomme.jpg"),
Container(
child: Column(
children: <Widget>[
QrImage(
data: "Number :",
version: QrVersions.auto,
size: 200.0,
),
Text("MEN'S ORIGINAL",style: TextStyle(
fontWeight: FontWeight.w100,
fontSize: 14
),),
Text("Smiths Shoes", style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
color: Color(0xFF2F2F3E)
),),
],
),
),
//Image.asset("images/pomme.jpg", width: 27, height: 30,),
/*Image(
          image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.lactualite.com%2F2014%2F08%2Fbanane.jpg&imgrefurl=https%3A%2F%2Flactualite.com%2Fsante-et-science%2Fune-banane-dopee%2F&tbnid=Pjal_88xeGctnM&vet=12ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ..i&docid=y5MWgtOihGqL2M&w=600&h=450&itg=1&q=banane&ved=2ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ'),
          width: 27,
          height: 30,
        ),*/
],
),
);*/