import 'package:flutter/material.dart';
import 'package:musicapp/constant.dart';
import 'package:musicapp/models/browse.dart';

class Browse extends StatefulWidget {
  const Browse({Key key}) : super(key: key);

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 6;
    final double itemWidth = size.width / 2;
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: new InputDecoration(
              fillColor: kDarkPrimaryColor,
              prefixIcon: new Icon(
                Icons.search,
                color: kDarkPrimaryColor,
              ),
              hintText: 'Artists, songs, or podcasts',
              hintStyle: TextStyle(
                  color: kDarkPrimaryColor, fontWeight: FontWeight.bold),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: kDarkSecondaryColor, width: 3),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Browse all',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Nexa',
                color: kDarkPrimaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.62,
            child: GridView.count(
              childAspectRatio: (itemWidth / itemHeight),
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: List.generate(browse.length, (index) {
                return Container(
                  child: Card(
                    color: Color(browse[index].color),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        browse[index].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nexa',
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
