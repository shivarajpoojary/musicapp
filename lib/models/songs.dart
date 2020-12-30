class Song {
  final String songName;
  final String artist;
  final String image;
  final int id;

  Song({this.id, this.songName, this.artist, this.image});
}

List<Song> songs = [
  Song(
      id: 1,
      songName: 'Alone',
      image: "assets/images/meditation.jpg",
      artist: 'Marshmello'),
  Song(
      id: 2,
      songName: 'Break Up Song',
      image: "assets/images/party.jpg",
      artist: 'Arijit Sigh'),
  Song(
      id: 3,
      songName: 'A million dreams',
      image: "assets/images/colors.jpg",
      artist: 'Ziv Zaifman'),
  Song(
      id: 4,
      songName: 'Zoobi Doobi',
      image: "assets/images/love.jpg",
      artist: 'Sonu Nigam'),
  Song(
      id: 5,
      songName: 'Parwah Nahi',
      image: "assets/images/colors.jpg",
      artist: 'Shirley'),
  Song(
      id: 6,
      songName: 'Found you',
      image: "assets/images/relax.jpg",
      artist: 'Austin'),
  Song(
      id: 7,
      songName: 'Shallow',
      image: "assets/images/color.jpg",
      artist: 'Lady Gaga'),
  Song(
      id: 8,
      songName: 'Photograph',
      image: "assets/images/party.jpg",
      artist: 'Peter'),
];
