import 'package:flutter/material.dart';
import 'package:flutterblocvalidation/blocs/product_bloc.dart';
import 'package:flutterblocvalidation/ui/screens/home.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create:(_) => ProductBloc()),
    ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
