import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/screens/manageBrand/controller/manage_brand_controller.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'styles.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  ManagebrandController managebrandController =
      Get.find<ManagebrandController>();
  RxBool isLoading = false.obs;
  List<String> data = [
    "Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. ",
    "Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. ",
    "Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit ",
    "Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. "
  ];

  @override
  void initState() {
    isLoading(true);
    managebrandController.fetchReview().then((value) => isLoading(false));
    super.initState();
  }

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
      body: Obx(
        () => isLoading.value
            ? const LoaderWidget()
            : Column(
                children: [
                  Text('reviews'.tr, style: label),
                  SizedBox(height: Get.height * 0.015),
                  SmoothStarRating(
                    allowHalfRating: true,
                    onRatingChanged: (value) {
                      setState(() {});
                    },
                    starCount: 5,
                    rating: managebrandController
                            .reviewStatesModel.value.averageRating ??
                        0,
                    size: 35.0,
                    color: Colors.black,
                    borderColor: Colors.black,
                    spacing: 0.0,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  ListView.separated(
                    itemCount: managebrandController.reviewList.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(
                      height: Get.height * 0.02,
                      color: Colors.transparent,
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset(Images.profile),
                        title: Text(
                          managebrandController.reviewList[index].comment ?? "",
                          style: transDesc,
                          textAlign: TextAlign.justify,
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
