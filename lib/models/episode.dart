class Episode {
  final String songName;
  final String duration;
  final String image;
  final int id;

  Episode({this.id, this.songName, this.duration, this.image});
}

List<Episode> episode = [
  Episode(
      id: 1,
      songName: 'How to build Stronger Relationship',
      image: "assets/images/meditation.jpg",
      duration: 'MON- 1HR 1 MIN LEFT'),
  Episode(
    id: 2,
    songName: 'Arijith sign Party song',
    image: "assets/images/party.jpg",
    duration: 'SUN-2 HR 20 MIN LEFT',
  )
];
