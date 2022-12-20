import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:start_application/models/store_userlogInData.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _userData = UserData();
  late Map _userInfo;
  //
  //
  //Methods-------------------------------------------------------------------------
  void getUserData() async {
    await _userData.getUserData.then((value) {
      _userInfo = value;
    }).onError((error, stackTrace) {
      print('getting user data unsuccessful');
      _userInfo = Map<String, String>();
    });
  }

//
//
//
  //Build Function------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Card One-----------------------------------------------------------------------
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
                  // Card Two-----------------------------------------------------------------------
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: isWelcomeScreen ? 320 : 540,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/login.png',
                              fit: BoxFit.cover,
                            ),
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
            getUserData();
            setState(() {
              isWelcomeScreen = false;
            });
            await Future.delayed(Duration(
              seconds: 1,
            ));
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

//----------------------------------------------------------------------------------
  Form loginWidget() {
    return Form(
      key: _formKey,
      child: Column(
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
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(label: Text('UserName')),
              validator: (value) {
                if (_userInfo.containsKey('userName') &&
                    _userInfo['userName'] == value!) {
                  return null;
                }
                return 'UserName does not matched';
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left:
                    BorderSide(width: 5, color: Theme.of(context).primaryColor),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.symmetric(vertical: 2.5),
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Password')),
              validator: (value) {
                if (_userInfo.containsKey('password') &&
                    _userInfo['password'] == value!) {
                  return null;
                }
                return 'Password does not matched';
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pushReplacementNamed(Home.routeName);
              }
            },
            style: ElevatedButton.styleFrom(elevation: 0.0),
            child: const Center(
              child: Text(
                'Login',
                textScaleFactor: 1.5,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  displayValue = DisplayValue.none;
                  isWelcomeScreen = true;
                });
              },
              child: Center(
                  child: Text(
                'Back',
                textScaleFactor: 1.5,
              )))
        ],
      ),
    );
  }
}
