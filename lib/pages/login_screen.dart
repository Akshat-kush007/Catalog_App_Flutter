import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DisplayValue { none, signIn, logIn }

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  static const routeName = '/login_screen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //Varibles------------------------------------------------------------------------
  DisplayValue displayValue = DisplayValue.none;
  final _usernameControler = TextEditingController();
  final _passwordControler = TextEditingController();

  //Methods-------------------------------------------------------------------------

  //Build Function------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "LogIn-Screen",
                        textScaleFactor: 2.0,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/login.png'),
                        Divider(
                          height: 5,
                          thickness: 1.0,
                        ),
                        Text(
                          'Catalog-Application',
                          textScaleFactor: 2.0,
                          style:
                              GoogleFonts.pacifico(fontWeight: FontWeight.w400),
                        ),
                        Divider(
                          thickness: 1,
                          height: 16,
                        ),
                        if (displayValue == DisplayValue.none)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    displayValue = DisplayValue.signIn;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'SignIn',
                                    textScaleFactor: 1.5,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    displayValue = DisplayValue.logIn;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'LogIn',
                                    textScaleFactor: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (displayValue == DisplayValue.logIn) loginWidget(),
                        if (displayValue == DisplayValue.signIn) loginWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column loginWidget() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 5, color: Theme.of(context).primaryColor))),
          padding: EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.symmetric(vertical: 2.5),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text('UserName')),
            controller: _usernameControler,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 5, color: Theme.of(context).primaryColor))),
          padding: EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.symmetric(vertical: 2.5),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(label: Text('Password')),
            controller: _passwordControler,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print('UserName : ' + _usernameControler.text);
              print('Password : ' + _passwordControler.text);
              setState(() {
                _passwordControler.text = "";
                _usernameControler.text = "";
                displayValue = DisplayValue.none;
              });
            },
            style: ElevatedButton.styleFrom(elevation: 0.0),
            child: Center(
                child: Text(
              'Login',
              textScaleFactor: 1.5,
            )))
      ],
    );
  }
}
