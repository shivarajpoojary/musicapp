import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constant.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 10, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: kDarkSecondaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kDarkSecondaryColor,
                  fontFamily: 'Nexa',
                ),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
            color: kDarkSecondaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          buildAccountOptionRow(context, "Change password"),
          buildAccountOptionRow(context, "Content settings"),
          buildAccountOptionRow(context, "Social"),
          buildAccountOptionRow(context, "Language"),
          buildAccountOptionRow(context, "Privacy and security"),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Icon(
                Icons.volume_up,
                color: kDarkSecondaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Notifications",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kDarkSecondaryColor),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
            color: kDarkSecondaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          buildNotificationOptionRow("New for you", true),
          buildNotificationOptionRow("Account activity", true),
          buildNotificationOptionRow("Opportunity", false),
          SizedBox(
            height: 50,
          ),
          Center(
            child: OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {},
              child: Text(
                "SIGN OUT",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2.2,
                  color: kDarkSecondaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
              fontFamily: 'Nexa'),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: kDarkSecondaryColor,
            value: isActive,
            onChanged: (bool val) {},
          ),
        )
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
                fontFamily: 'Nexa',
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kDarkSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
