import 'package:flutter/material.dart';
import 'package:sag_ref/list.dart';
import 'package:sag_ref/product.dart';
import './product.dart';
import './main.dart';
import './qrcode.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail(this.product);


  @override
  _ProductDetailState createState() => _ProductDetailState(this.product);
}

class _ProductDetailState extends State<ProductDetail> {
  Product product;
  _ProductDetailState(this.product);

  void modifier()
  {
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>Home(2,product.id)));
  }
  void generer()
  {
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>qrCode(product.productName)));
  }
  Future supprimer ()async
  {
    Navigator.push(
      context, new MaterialPageRoute(builder: (context) => ProductsList()));
    /*var data=await http.delete("http://localhost:1337/api/products/${product.id}",headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },);
*/
  }

  @override
  Widget build(BuildContext context) {
    var productId=product.id;
    var productName=product.productName;
    var productNumber=product.productNumber;
    var productPrice=product.productPrice;
    var productQuantity=product.productQuantity;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(product.productName),backgroundColor: Colors.black,),
        body: Container(
          color: Colors.black.withOpacity(0.1),
          margin:const EdgeInsets.only(left: 40.0,top: 40.0,right: 40.0,bottom: 120),
          alignment: Alignment.center,
          child: Center(child:Padding(padding: EdgeInsets.all(19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(19),
                child:(
                    Text("Numéro du produit  :  "+productId.toString(),style: TextStyle(fontSize: 20),)
                ),),
                Padding(padding: EdgeInsets.all(19),
                  child:(
                      Text("Nom du produit  :  "+productName,style: TextStyle(fontSize: 20),)
                  ),),
                Padding(padding: EdgeInsets.all(19),
                  child:(
                      Text("Quantité restante  :  "+productQuantity.toString(),style: TextStyle(fontSize: 20),)
                  ),),
                Row(
                  children: [
                    InkWell(
                      onTap: modifier,
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
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 110,
                              padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Modifier", style: TextStyle(
                                  //fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
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
                            Icon(Icons.edit ),


                            /*MaterialButton(onPressed: (){},//_captureAndSharePng,
                                  color: Colors.black,
                                  textColor: Colors.white,
                                  child:
                              ),*/

                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: generer,
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
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 110,
                              padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Génerer", style: TextStyle(
                                  //fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
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
                            Icon(Icons.qr_code_2 ),


                            /*MaterialButton(onPressed: (){},//_captureAndSharePng,
                                  color: Colors.black,
                                  textColor: Colors.white,
                                  child:
                              ),*/

                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: supprimer,
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
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 110,
                              padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Supprimer", style: TextStyle(
                                  //fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
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
                            Icon(Icons.delete ),


                            /*MaterialButton(onPressed: (){},//_captureAndSharePng,
                                  color: Colors.black,
                                  textColor: Colors.white,
                                  child:
                              ),*/

                          ],
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          )

          /*QrImage(
            data: "Number : $productNumber ; Name : $productName  ; Quantity : $productQuantity ; Price : $productPrice ;  ",
            version: QrVersions.auto,
            size: 200.0,
          ),*/
          ),


        ),
      ),
    );
  }
}