import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class ProductBloc {

  final _productName = BehaviorSubject<String>();
  final _productPrice = BehaviorSubject<String>();

  //Get Stream with Attached Validation
  Stream<String> get productName =>
      _productName.stream.transform(validationProductName);

  Stream<double> get productPrice =>
      _productPrice.stream.transform(validationProductPrice);

  Stream<bool> get productValid => Rx.combineLatest2(productName, productPrice, (productName,productPrice)=>true);


//Set
  Function(String) get changeProductName => _productName.sink.add;

  Function(String) get changeProductPrice => _productPrice.sink.add;

  dispose() {
    _productName.close();
    _productPrice.close();
  }

//Validation ProductName
  final validationProductName = StreamTransformer<String, String>.fromHandlers(
      handleData: (productName, sink) {
    if (productName.length < 4) {
      sink.addError('Product Name Must Be At Least 4 Chars.');
    } else {
      sink.add(productName);
    }
  });

//Validation ProductPrice
  final validationProductPrice = StreamTransformer<String, double>.fromHandlers(
      handleData: (productPrice, sink) {
    try {
      sink.add(double.parse(productPrice));
    } catch (error) {
      sink.addError('Value Must Be A Number');
    }
  });
submitProduct(){
  print('Product : ${_productName.value} ,  Product :${_productPrice.value}');
}

}
