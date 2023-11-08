import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/screens/customer/component/customers.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/src/pages/profile.dart';
import 'styles.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  List<String> data = [
    "Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. ",
    "Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. ",
    "Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit ",
    "Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. "
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF0E2ED4),
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Text('Reviews', style: label),
              SizedBox(height: Get.height * 0.015),
              SmoothStarRating(
                allowHalfRating: false,
                onRatingChanged: (value) {
                  setState(() {});
                },
                starCount: 5,
                rating: 4,
                size: 35.0,
                color: Colors.black,
                borderColor: Colors.black,
                spacing: 0.0,
              ),
              SizedBox(height: Get.height * 0.02),
              ListView.separated(
                itemCount: data.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                  height: Get.height * 0.02,
                  color: Colors.transparent,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(Images.profile),
                    title: Text(
                      data[index],
                      style: transDesc,
                      textAlign: TextAlign.justify,
                    ),
                  );
                },
              ),
              /* Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Image.asset('assets/review.png'),
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa.',
                            style: transDesc,
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Image.asset('assets/review.png'),
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa.',
                            style: transDesc,
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Image.asset('assets/review.png'),
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit',
                            style: transDesc,
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Image.asset(Images.profile),
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa.',
                            style: transDesc,
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
             */
            ],
          ),
        ],
      ),
    );
  }
}
