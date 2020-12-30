import 'package:flutter/material.dart';
import 'package:musicapp/constant.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget build(BuildContext context) {
    return Hero(
      tag: 'dash',
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: kDarkSecondaryColor,
            ),
            accountName: Text(
              'Welcome!',
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text("person@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              backgroundImage: AssetImage("assets/images/1.jpg"),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.home,
              color: kDarkSecondaryColor,
            ),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.queue_music,
              color: kDarkSecondaryColor,
            ),
            title: Text("My Music"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.radio,
              color: kDarkSecondaryColor,
            ),
            title: Text("Radio"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.speaker_phone,
              color: kDarkSecondaryColor,
            ),
            title: Text("Hellotunes"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.library_music,
              color: kDarkSecondaryColor,
            ),
            title: Text("Local Mp3 Songs"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.notifications,
              color: kDarkSecondaryColor,
            ),
            title: Text("Updates"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.settings,
              color: kDarkSecondaryColor,
            ),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
