import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:start_application/pages/signIn.dart';

import 'home.dart';

enum DisplayValue { none, logIn }

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  static const routeName = '/login_screen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //
  //
  //
  //Varibles------------------------------------------------------------------------
  DisplayValue displayValue = DisplayValue.none;
  bool isWelcomeScreen = true;
  final _usernameControler = TextEditingController();
  final _passwordControler = TextEditingController();

  //Methods-------------------------------------------------------------------------
//
//
//
//
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
                //Card One------------------------------------------------------
                Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        isWelcomeScreen ? "Welcome" : 'LogIn',
                        textScaleFactor: 2.0,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                //
                // Card Two----------------------------------------------------------------
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: isWelcomeScreen ? 320 : 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/login.png'),
                          const Divider(
                            height: 5,
                            thickness: 1.0,
                          ),
                          Text(
                            'Catalog-Application',
                            textScaleFactor: 2.0,
                            style: GoogleFonts.pacifico(
                                fontWeight: FontWeight.w400),
                          ),
                          const Divider(
                            thickness: 1,
                            height: 16,
                          ),
                          isWelcomeScreen
                              ? optionWidget(context)
                              : displayValue == DisplayValue.logIn
                                  ? loginWidget()
                                  : SizedBox()
                        ],
                      ),
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

// Switchable Widgets=========================================================================
  Row optionWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () {
            setState(() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignInPage()));
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'SignIn',
              textScaleFactor: 1.5,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              isWelcomeScreen = false;
            });
            await Future.delayed(Duration(seconds: 2, microseconds: 200));
            setState(() {
              displayValue = DisplayValue.logIn;
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'LogIn',
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Column loginWidget() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 5,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(vertical: 2.5),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text('UserName')),
            controller: _usernameControler,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(width: 5, color: Theme.of(context).primaryColor),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(vertical: 2.5),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: const InputDecoration(label: Text('Password')),
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
                isWelcomeScreen = true;
                // logic is remaning in this for validation
                // Navigator.of(context).pushReplacementNamed(Home.routeName);
              });
            },
            style: ElevatedButton.styleFrom(elevation: 0.0),
            child: const Center(
                child: Text(
              'Login',
              textScaleFactor: 1.5,
            )))
      ],
    );
  }
}
