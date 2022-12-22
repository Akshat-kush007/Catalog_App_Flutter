import 'package:flutter/material.dart';
import 'package:start_application/widgets/productUi.dart';

import '../models/product_data.dart';
import '../widgets/mydrawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  static final routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Varibles============================================================
  final _formKey = GlobalKey<FormState>();
  List<Product> _productList = [];
  bool isProductLoaded = false;

  //Methods==============================================================
  @override
  void initState() {
    super.initState();
    initializeProduct();
  }

  //Functions============================================================
  void initializeProduct() async {
    print("Call to initialize ");
    var prodObject = ProductData();
    _productList = await prodObject.productData;
    if (_productList.isEmpty) {
      print('Empty-------List');
    }
    setState(() {
      print('get responce');
      isProductLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: isProductLoaded
            ? ListView.builder(
                itemCount: _productList.length,
                // itemCount: ,
                itemBuilder: ((context, index) {
                  return ProductUI(product: _productList[index]);
                }))
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
