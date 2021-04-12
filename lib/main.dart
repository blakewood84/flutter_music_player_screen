import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SongScreen(),
    );
  }
}

class SongScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Image.asset('assets/deadmau5_album.jpg',
                fit: BoxFit.fitHeight, height: size.height),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(color: Colors.black87.withOpacity(0.5)
                // decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5))
                ),
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * .1),
                Image.asset('assets/deadmau5_album.jpg',
                    width: size.width * .85),
                SizedBox(height: size.height * .025),
                Text(
                  'deadmau5 and Chris Lorenzo',
                  style: TextStyle(color: Colors.cyan, fontSize: 16.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
                SizedBox(height: size.height * .02),
                Text(
                  'Guests Drama Free(feat. Lights) and stuff',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
                SizedBox(height: size.height * .03),
                CustomSlider(),
                SizedBox(height: size.height * .01),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '0:34/3:19',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: size.height * .03),
                Container(
                  // decoration: new BoxDecoration(
                  //   border: Border.all(color: Colors.red),
                  // ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.skip_previous_outlined,
                          size: 40, color: Colors.cyan),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.cyan,
                          ),
                        ),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.cyan,
                          size: 40,
                        ),
                      ),
                      Icon(Icons.skip_next_outlined,
                          size: 40, color: Colors.cyan),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class CustomSlider extends StatelessWidget {
  Color positiveColor = Colors.white;
  Color negativeColor = Colors.grey[600];

  double percentage = 90.0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double totalWidth = 300;
    return Container(
        width: totalWidth,
        height: 3.0,
        decoration: BoxDecoration(
          color: negativeColor,
          // border: Border.all(
          //   color: Colors.white,
          //   width: 0,
          // )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                color: positiveColor, width: (percentage / 100) * totalWidth)
          ],
        ));
  }
}
