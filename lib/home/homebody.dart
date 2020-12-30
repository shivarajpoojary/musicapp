import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musicapp/constant.dart';
import 'package:musicapp/home/songscreen.dart';
import 'package:musicapp/models/artist.dart';
import 'package:musicapp/models/category.dart';
import 'package:musicapp/models/songs.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _buildPlaylistAndSongs(size),
                _buildArtistList(size),
                _recentPlayed(size),
                SizedBox(
                  height: size.height * 0.103,
                )
              ],
            ),
          ),
          Align(
            alignment: const Alignment(1.0, 1.0),
            child: _buildCurrentPlayingSong(size, context),
          ),
        ],
      ),
    );
  }

  Widget _recentPlayed(Size size) {
    return Container(
      height: 0.4 * size.height,
      width: size.width * 1,
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) => _buildSonglistItem(
          image: songs[index].image,
          title: songs[index].songName,
          subtitle: songs[index].artist,
        ),
      ),
    );
  }

  Widget _buildPlaylistAndSongs(Size size) {
    return Column(
      children: [
        Row(children: [
          Icon(
            Icons.list,
            color: kDarkPrimaryColor,
            size: 28,
          ),
          SizedBox(width: 10),
          Text(
            'Category',
            style: TextStyle(
              fontSize: 20,
              color: kDarkPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        Container(
          height: 0.2 * size.height,
          width: size.width * 1,
          // color: Colors.purple,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: playlists.length,
            itemBuilder: (context, index) => _buildPlaylistItem(
                image: playlists[index].image,
                title: playlists[index].playlistName),
          ),
        ),
      ],
    );
  }

  Widget _buildArtistList(Size size) {
    return Column(
      children: [
        Row(children: [
          Icon(
            Icons.queue_music,
            color: kDarkPrimaryColor,
            size: 28,
          ),
          SizedBox(width: 10),
          Text(
            'Artist',
            style: TextStyle(
              fontSize: 20,
              color: kDarkPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        Container(
          height: 0.2 * size.height,
          width: size.width * 1,
          // color: Colors.purple,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: artists.length,
            itemBuilder: (context, index) => _buildArtistlistItem(
                image: artists[index].image, title: artists[index].artistName),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaylistItem({String title, String image}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.orange,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(child: Container(height: 0)),
            Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Icon(
                Icons.play_circle_filled,
                color: kDarkSecondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildArtistlistItem({String title, String image}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.orange,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Expanded(child: Container(height: 0)),
            Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Icon(
                Icons.play_circle_filled,
                color: kDarkSecondaryColor,
              ),
            )
          ],
        ),
      ),
      // ),
      // ),
    );
  }

  Widget _buildSonglistItem({String image, String title, String subtitle}) {
    return Card(
      color: Colors.transparent,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  Widget _buildCurrentPlayingSong(Size size, BuildContext context) {
    return Container(
      height: size.height * 0.103,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      decoration: BoxDecoration(
        color: kDarkPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SongScreen()),
              );
            },
            child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/party.jpg')),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Break Up Song',
                style: TextStyle(
                    color: kDarkSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                'Arijith sigh',
                style: TextStyle(color: kDarkSecondaryColor, fontSize: 12),
              )
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Icon(
            Icons.favorite_border,
            color: kDarkSecondaryColor,
          ),
          SizedBox(width: 10.0),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10.0),
                color: Colors.white),
            child: Icon(
              Icons.pause_circle_filled,
              color: kDarkSecondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
