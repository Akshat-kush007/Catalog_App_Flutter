import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  //
  //Varibles
  late String _username;
  late String _password;

  //Form Controler
  final _passwordControler = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignIn')),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(
            //   "SignIn",
            //   textScaleFactor: 2.5,
            //   style: TextStyle(color: Theme.of(context).primaryColor),
            // ),
            // const Divider(
            //   thickness: 2,
            //   height: 10,
            // ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            hintText: 'Enter UserName'),
                        keyboardType: TextInputType.name,
                        validator: ((value) {
                          if (value == null || value == "") {
                            return 'Please Enter Username';
                          }
                          return null;
                        }),
                        onSaved: ((newValue) {}),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        controller: _passwordControler,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter Password'),
                        keyboardType: TextInputType.visiblePassword,
                        validator: ((value) {
                          if (value == null || value.length < 8) {
                            return 'Please Enter Password of alteast 8 character';
                          }
                          return null;
                        }),
                        onSaved: ((newValue) {}),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            hintText: 'Enter Confirm Password '),
                        keyboardType: TextInputType.visiblePassword,
                        validator: ((value) {
                          if (value == null ||
                              _passwordControler.text != value) {
                            return "Password doen't matched";
                          }
                          return null;
                        }),
                        onSaved: ((newValue) {}),
                      ),
                    ),
                    //DatePicker
                    //
                    ElevatedButton(
                        onPressed: () {
                          print("Clicked");
                          if (_formKey.currentState!.validate()) {
                            print('Pass');
                          }
                        },
                        child: const Center(
                          child: Text('Submit'),
                        ))
                  ],
                ))
          ],
        ),
      ))),
    ); // body:
  }
}
