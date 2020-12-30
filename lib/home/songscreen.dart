import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import '../constant.dart';

class SongScreen extends StatefulWidget {
  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> with TickerProviderStateMixin {
  AnimationController controller;
  // AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );
    _audioCache = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  // playme() async {
  //   AudioPlayer audioplay = await _audioCache.play('30sec.mp3');
  // }

  AudioCache _audioCache;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkPrimaryColor,
      body: Column(
        children: <Widget>[
          Container(
            height: 500.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/arijith.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      kDarkSecondaryColor.withOpacity(0.4),
                      kDarkPrimaryColor
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 52.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(50.0)),
                            child: GestureDetector(
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'PLAYLIST',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                              Text('Best Vibes of the Week',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Spacer(),
                      Text("Break Up song",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "Arijith Sigh",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 18.0),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 42.0),
          Slider(
            onChanged: (double value) {},
            value: 0.2,
            activeColor: kDarkSecondaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '2:10',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                Text('-03:56',
                    style: TextStyle(color: Colors.white.withOpacity(0.7)))
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.fast_rewind,
                color: Colors.white54,
                size: 42.0,
              ),
              SizedBox(width: 32.0),
              Container(
                decoration: BoxDecoration(
                    color: kDarkSecondaryColor,
                    borderRadius: BorderRadius.circular(50.0)),
                child: FloatingActionButton(
                  backgroundColor: kDarkSecondaryColor,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget child) {
                      return new Icon(
                        controller.isAnimating ? Icons.pause : Icons.play_arrow,
                        color: kDarkPrimaryColor,
                      );
                    },
                  ),
                  onPressed: () {
                    if (controller.isAnimating && isPlaying) {
                      controller.stop();
                    } else {
                      controller.reverse(
                          from:
                              controller.value == 0.0 ? 1.0 : controller.value);
                    }
                  },
                ),
              ),
              SizedBox(width: 32.0),
              Icon(
                Icons.fast_forward,
                color: Colors.white54,
                size: 42.0,
              )
            ],
          ),
          Spacer(),
          SizedBox(height: 58.0),
        ],
      ),
    );
  }
}
