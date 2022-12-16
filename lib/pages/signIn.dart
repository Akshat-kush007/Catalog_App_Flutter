import 'package:flutter/material.dart';
import 'package:start_application/models/store_userlogInData.dart';
import 'package:start_application/pages/home.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  //
  //Varibles
  late String _username;
  late String _password;
  final userData = UserData();

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
                        onSaved: ((newValue) {
                          _username = newValue!;
                        }),
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
                        onSaved: ((newValue) {
                          _password = newValue!;
                        }),
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
                      ),
                    ),
                    //DatePicker
                    //
                    ElevatedButton(
                        onPressed: () async {
                          print("Clicked");
                          if (_formKey.currentState!.validate()) {
                            print('Validation Pass');
                            _formKey.currentState!.save();
                            print(_username);
                            print(_password);
                            await userData
                                .setUserData(
                              userName: _username,
                              password: _password,
                            )
                                .then((value) {
                              if (value) {
                                print('Success');
                                Navigator.of(context)
                                    .pushReplacementNamed(Home.routeName);
                              } else {
                                print('Error');
                              }
                            });
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
