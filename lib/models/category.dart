class Category {
  final String playlistName;
  final String image;
  final int id;

  Category({this.id, this.playlistName, this.image});
}

List<Category> playlists = [
  Category(
    id: 1,
    playlistName: 'Party',
    image: "assets/images/party.jpg",
  ),
  Category(
    id: 2,
    playlistName: 'Peace',
    image: "assets/images/meditation.jpg",
  ),
  Category(
    id: 3,
    playlistName: 'Sad',
    image: "assets/images/colors.jpg",
  ),
  Category(
    id: 4,
    playlistName: 'Romance',
    image: "assets/images/love.jpg",
  ),
];
