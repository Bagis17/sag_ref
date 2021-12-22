import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sag_ref/detail.dart';
import './main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:sag_ref/product.dart';
import 'package:flutter/services.dart';
import './entete.dart';
class ProductForm extends StatefulWidget {
  int id;
  ProductForm(this.id);

  @override
  _ProductFormState createState() => _ProductFormState(this.id);
}

class _ProductFormState extends State<ProductForm> {
  int id;
  double _headerHeight = 250;

  _ProductFormState(this.id);

  final log = Logger();
  Product product = Product(0, 0, '', '', 0, 0);

  Future enregistrer() async {
    var data = jsonEncode({
      'data': {
        'productNumber': product.productNumber,
        'productName': product.productName,
        'productCode': product.productCode,
        'productPrice': product.productPrice,
        'productQuantity': product.productQuantity
      }
    });
    if (product.id == 0) {
      await http.post("http://localhost:1337/api/products",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: data
      );
    }
    else {
      await http.put("http://localhost:1337/api/products/${product.id}",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: data
      );
    }
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Home(1, 0)));
  }

  @override
  initState() {
    super.initState();
    if (this.id != 0) {
      getOne();
    }
  }

  void getOne() async {
    var data = await http.get("http://localhost:1337/api/products/${this.id}");
    var jsonData = json.decode(data.body);
    log.i("Donnnnnnnnnnn : $jsonData");
    //var id=jsonData["id"];
    var prod = jsonData["data"];
    var att = prod["attributes"];
    var productNumber = att["productNumber"];
    var productName = att["productName"];
    var productCode = att["productCode"];
    var productPrice = att["productPrice"];
    var productQuantity = att["productQuantity"];
    setState(() {
      product = Product(
          this.id, productNumber, productName, productCode, productPrice,
          productQuantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black.withOpacity(0.1),
        margin:const EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0,bottom: 120),
        alignment: Alignment.center,
        //width: double.infinity,
        //height: double.infinity,
        child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.app_registration_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                child: Form(

                child:
                Padding(padding: EdgeInsets.all(30.0),

                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.all(10.0),
                      child:Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 5.0, bottom: 30.0),
                            child:Text("Numéro du produit",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //Expanded(),
                          TextField(
                            controller: TextEditingController(
                                text: product.productNumber.toString()),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (val) {
                              int value = int.parse(val);
                              product.productNumber = value;
                              log.i("Valeur :$val Type :${val.runtimeType} ");
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Entrez le numéro du produit",
                              focusedBorder:OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              //hintText: "Le numéro du produit",
                              //hintStyle: TextStyle(color: Colors.grey[800]),
                              //border: La bordure à ajouter
                            ),
                          ),

                        ],
                      ),
                      ),
                      Padding(padding: EdgeInsets.all(10.0),
                        /*child:Column(
                          children: [
                            Text("Product Number"),
                            //Expanded(),

                          ],
                        ),*/
                        child:Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                              child:Text("Nom du produit",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            //Expanded(),
                            TextField(
                              controller: TextEditingController(text: product.productName),

                              onChanged: (val) {
                                product.productName = val;
                                log.i("Valeur :$val Type :${val.runtimeType} ");
                              },
                              decoration: InputDecoration(
                                //labelText: "Product Name",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Entrez le nom du produit",
                                focusedBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                //border: La bordure à ajouter
                                border: OutlineInputBorder(
                                  //borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10.0),
                        child:Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                              child:Text("Code du produit",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Expanded(),
                            TextField(
                              controller: TextEditingController(text: product.productCode),
                              onChanged: (val) {
                                product.productCode = val;
                                log.i("Valeur :$val Type :${val.runtimeType} ");
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Entrez le code du produit",
                                focusedBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                //labelText: "Product Code",
                                //border: La bordure à ajouter
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),

                          ],
                        ),

                      ),
                      Padding(padding: EdgeInsets.all(10.0),
                        child:Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                              child:Text("Prix du produit",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            //Expanded(),
                            TextField(
                              controller: TextEditingController(
                                  text: product.productPrice.toString()),
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                int value = int.parse(val);
                                product.productPrice = value;
                                log.i("Valeur :$val Type :${val.runtimeType} ");
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Entrez le prix du produit",
                                focusedBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                //labelText: "Product Price",
                                //border: La bordure à ajouter
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10.0),
                        child:Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                              child:Text("Quantité",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Expanded(),
                            TextField(
                              controller: TextEditingController(
                                  text: product.productQuantity.toString()),
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                int value = int.parse(val);
                                product.productQuantity = value;
                                log.i("Valeur :$val Type :${value.runtimeType} ");
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Entrez la quantité",
                                focusedBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                //labelText: "Product Quantity",
                                //border: La bordure à ajouter
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                      InkWell(
                        onTap: enregistrer,
                        child: Container(
                          margin: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                          width: 300,
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
                                width: 200,
                                padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Enregistrer", style: TextStyle(
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
                              Icon(Icons.save ),


                              /*MaterialButton(onPressed: (){},//_captureAndSharePng,
                                          color: Colors.black,
                                          textColor: Colors.white,
                                          child:
                                      ),*/

                            ],
                          ),
                        ),
                      ),
                  ]
    )
                )
      ),
              ),
            ),
          ],
        )
    )
    );
  }
}