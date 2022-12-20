import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/login.png')),
              accountName: Text('Akshat Kushwah'),
              accountEmail: Text('akhsatkush.dev@gmail.com'),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text(
              'Home',
              textScaleFactor: 1.2,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text(
              'Profile',
              textScaleFactor: 1.2,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(CupertinoIcons.bars),
            title: Text(
              'About-App',
              textScaleFactor: 1.2,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
