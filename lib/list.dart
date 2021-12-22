//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './detail.dart';
import 'dart:async';
import 'dart:convert';
import './product.dart';
import 'dart:io';
import 'package:logger/logger.dart';
import './detail.dart';
import 'package:shimmer/shimmer.dart';
import './cloader3.dart';
import './entete.dart';
class ProductsList extends StatefulWidget {
  //final Future<Product> products;
  const ProductsList({ Key? key }) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final log=Logger();
  double _headerHeight = 250;
  List<Product> products=[];

  Future<Map<String, dynamic>> getAll() async{
    var data = await http.get("http://localhost:1337/api/products");
    log.i(data.toString());
    var jsonData=json.decode(data.body);
    var donne=jsonData["data"];
    log.i("On entre : $donne");
    int i=0;
    for (var element in donne){
      var im=element['productImage'];
      log.i("\n Pour $i, on a : $im  ");
      products.add(Product(element['id'],element['productNumber'],element['productName'],element['productCode'],element['productPrice'],element['productQuantity']/*,element['productImage']*/));
      i++;
    }
    //Map<String, dynamic> doc = Map<String, dynamic>.from(jsonData);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          Container(
            height: _headerHeight,
            child: HeaderWidget(_headerHeight, true, Icons.list_rounded), //let's create a common header widget
          ),
          Container(
            child: FutureBuilder<Map<String, dynamic>> (
              future: getAll(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data==null){
                  return Container(child: Center(
                    child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: ColorLoader3(),
                    ),
                  ));
                }else {
                  var product= snapshot.data;
                  var prod= product["data"];
                  log.i(" prod ::: $prod !!!!");

                  return ListView.builder(
                      itemCount: prod.length, //itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        var unProduit=prod[index];
                        var id=unProduit["id"];
                        var att=unProduit["attributes"];
                        var productNumber=att["productNumber"];
                        var productName=att["productName"];
                        var productCode=att["productCode"];
                        var productPrice=att["productPrice"];
                        var productQuantity=att["productQuantity"];
                        //var productImage=att["productImage"];
                        Product leProduit=Product(id,productNumber,productName,productCode,productPrice,productQuantity/*,productImage*/);
                        return InkWell(
                            onTap: (){
                              Navigator.push(context,new MaterialPageRoute(builder: (context)=>ProductDetail(leProduit)));
                            },
                          child: Container(
                            margin: EdgeInsets.all(20.0),
                            height: 60,
                            color: Colors.black.withOpacity(0.1),
                           /* child: ListTile(
                              title: Text(productName),
                              subtitle: Text(productQuantity.toString()),
                              onTap: (){
                                Navigator.push(context,new MaterialPageRoute(builder: (context)=>ProductDetail(leProduit)));
                              },
                            ),*/
                            child: Stack(

                              children: [
                                Positioned.fill(
                                    child:ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Text((index+1).toString(),
                                                //textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(left: 100,top: 10),
                                              child: Column(
                                                children: [
                                                  Text(productName,
                                                    //textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                    ),),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 10.0),
                                                    child: Text(productQuantity.toString(),
                                                      //textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                      ),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Text(productPrice.toString(),
                                                //textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Colors.pinkAccent,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                            ),
                                          ],
                                        )
                                    ),
                                )
                              ],
                            ),


                          ),
                        );
                      }
                  );
                }
              }

            ),
          ),
        ],
      ),
    );
  }
}