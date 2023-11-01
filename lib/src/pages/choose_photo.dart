import 'package:flutter/material.dart';
import 'styles.dart';

class ChoosePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_photo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_black.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 75,
                child: Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/circle_image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: photoBtn,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text('Cancel', style: photoText),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => CreateAccount(),
                                  //   ),
                                  // );
                                },
                                style: photoBtn,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 5.0),
                                        child: Image.asset('assets/tick.png'),
                                      ),
                                      Text('Choose', style: photoText),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
