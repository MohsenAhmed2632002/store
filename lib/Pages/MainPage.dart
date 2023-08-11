import 'package:flutter/material.dart';
import 'package:store/Models.dart';
import 'package:store/Services.dart';

import '../Widgets.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Trend",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: FutureBuilder<List<ProductModel>>(
            future: ProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return AllProductPage(products: products);
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
            }),
      ),
    );
  }
}
