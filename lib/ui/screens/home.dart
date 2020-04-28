import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              productName(),
              productPrice(),
              SizedBox(height: 15,),
              button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget productName() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Product Name',
      ),
    );
  }

  Widget productPrice() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Product Price',
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      onPressed: () {},
      child: Text('Save Data'),
    );
  }
}
