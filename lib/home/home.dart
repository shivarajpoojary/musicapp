import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/constant.dart';
import 'package:musicapp/home/account.dart';
import 'package:musicapp/home/browse.dart';
import 'package:musicapp/home/drawer.dart';
import 'package:musicapp/home/homebody.dart';
import 'package:musicapp/home/podcast.dart';
import 'package:musicapp/home/popupitem.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // int _selectedIndex = 0;

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      print('Settings');
    } else if (choice == Constants.Subscribe) {
      print('Subscribe');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
  }

  int _selectedTab = 0;
  final _pageOptions = [
    HomeBody(),
    Browse(),
    Podcast(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/images/music.jpg"),
        fit: BoxFit.cover,
      )),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            child: Scaffold(
              resizeToAvoidBottomPadding: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: kDarkSecondaryColor,
                ),
                title: Center(
                  child: Text(
                    'Booom',
                    style: GoogleFonts.sail(
                      fontSize: 22,
                      color: kDarkSecondaryColor,
                    ),
                  ),
                ),
                actions: [
                  Icon(
                    Icons.favorite,
                    color: kDarkSecondaryColor,
                  ),
                  PopupMenuButton<String>(
                    onSelected: choiceAction,
                    itemBuilder: (BuildContext context) {
                      return Constants.choices.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
                backgroundColor: kDarkPrimaryColor,
              ),
              drawer: Drawer(
                child: MainDrawer(),
              ),
              body: _pageOptions[_selectedTab],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedTab,
                onTap: (int index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
                elevation: 1,
                backgroundColor: kDarkPrimaryColor,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    title: Text('Browse'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.radio),
                    title: Text('Podcast'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),

                    title: Text('Account'),

                    // label: 'School',
                  ),
                ],
                selectedItemColor: kDarkSecondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
