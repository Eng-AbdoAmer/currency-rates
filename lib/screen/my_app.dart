import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/network/internets_request.dart';

import '../model/datum.dart';

class PriceApp extends StatefulWidget {
  const PriceApp({Key? key}) : super(key: key);

  @override
  State<PriceApp> createState() => _PriceAppState();
}

class _PriceAppState extends State<PriceApp> {
  List<Datum> listOfPrices = [];
  bool isLoading = true;

  @override
  void initState() {
    x();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: listOfPrices.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.amber,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    title: Text(
                      listOfPrices[i].name,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      listOfPrices[i].symbol,
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: [
                        Text("price",style: TextStyle(fontSize: 18,color:Colors.black),),
                        SizedBox(height: 5,),
                        Text(listOfPrices[i].quote.usd.price.toString()),
                      ],
                    ),
                  ),
                );
              }),
    );
  }

  void x() async {
    String? r = await InternetsRequest.getRequest();
    if (r != null) {
      listOfPrices = mymodelFromJson(r);
      setState(() {
        isLoading = false;
      });
    }
  }
}
