import 'package:flutter/material.dart';
import 'package:musicapp/constant.dart';
import 'package:musicapp/models/episode.dart';

class Podcast extends StatefulWidget {
  const Podcast({Key key}) : super(key: key);

  @override
  _PodcastState createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  String selectedTab;
  static const String TAB_1 = 'Episodes';
  static const String TAB_2 = 'Downloads';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 8.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() => selectedTab = TAB_1);
                },
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    TAB_1,
                    style: TextStyle(
                        color: kDarkSecondaryColor,
                        fontSize: 20,
                        fontFamily: 'Nexa'),
                  ),
                  decoration: selectedTab == TAB_1
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 3.0,
                              color: kDarkPrimaryColor,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() => selectedTab = TAB_2);
                },
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    TAB_2,
                    style: TextStyle(
                      color: kDarkSecondaryColor,
                      fontSize: 20,
                      fontFamily: 'Nexa',
                    ),
                  ),
                  decoration: selectedTab == TAB_2
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 3.0,
                              color: kDarkPrimaryColor,
                            ),
                          ),
                        )
                      : null,
                ),
              )
            ],
          ),
          Container(height: 20.0),
          Expanded(
            flex: 2,
            child: Container(
              child: selectForTab(selectedTab),
            ),
          )
        ],
      ),
    );
  }

  Widget selectForTab(String tabId) {
    switch (tabId) {
      case TAB_1:
        return Container(
          child: ListView.builder(
              itemCount: episode.length,
              itemBuilder: (context, index) => _buildPodcatslistItem(
                    image: episode[index].image,
                    title: episode[index].songName,
                    subtitle: episode[index].duration,
                  )),
        );
      case TAB_2:
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No downloads yet',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Nexa',
                  color: kDarkPrimaryColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Tap ",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: ' NexaLight',
                        color: kDarkPrimaryColor,
                      ),
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.arrow_downward,
                        size: 18,
                        color: kDarkPrimaryColor,
                      ),
                    ),
                    TextSpan(
                      text: " on an episode to listen without connection",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: ' NexaLight',
                        color: kDarkPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                height: 40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: () {},
                  color: kDarkSecondaryColor,
                  textColor: kDarkPrimaryColor,
                  child: Text(
                    "browse podcasts".toUpperCase(),
                    style: TextStyle(fontSize: 16, fontFamily: 'NexaLight'),
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return Text('non');
    }
  }

  Widget _buildPodcatslistItem({String image, String title, String subtitle}) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                title: Text(title),
                subtitle: Text(subtitle),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
            Icon(
              Icons.check,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
