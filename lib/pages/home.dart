import 'package:flutter/material.dart';

import '../widgets/mydrawer.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  static final routeName = '/home';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      // body: ,
      drawer: MyDrawer(),
    );
  }
}
