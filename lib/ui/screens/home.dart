import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterblocvalidation/blocs/product_bloc.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productBloc = Provider.of<ProductBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              productName(productBloc),
              productPrice(productBloc),
              SizedBox(
                height: 15,
              ),
              button(productBloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget productName(ProductBloc productBloc) {
    return StreamBuilder<String>(
      stream: productBloc.productName,
      builder: (context, snapshot) {
        return TextField(
          onChanged: productBloc.changeProductName,

          decoration: InputDecoration(
          errorText: snapshot.error,
            labelText: 'Product Name',
          ),
        );
      }
    );
  }

  Widget productPrice(ProductBloc productBloc) {
    return StreamBuilder<double>(
      stream: productBloc.productPrice,
      builder: (context, snapshot) {
        return TextField(
          onChanged: productBloc.changeProductPrice,
          decoration: InputDecoration(
            errorText: snapshot.error,
            labelText: 'Product Price',
          ),
        );
      }
    );
  }

  Widget button(ProductBloc productBloc) {
    return StreamBuilder<bool>(
      stream: productBloc.productValid,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: !snapshot.hasData ? null : productBloc.submitProduct,
          child: Text('Save Data'),
        );
      }
    );
  }
}

