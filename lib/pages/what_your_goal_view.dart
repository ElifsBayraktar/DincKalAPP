import 'package:carousel_slider/carousel_slider.dart';
import 'package:dinckallapp/view/home/home.dart';
import 'package:flutter/material.dart';
import '../common/colo_extension.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  CarouselController buttonCarouselController = CarouselController();

  List goalArr = [
    {
      "image": "assets/images/kaslanmakgoal.png",
      "title": "Kas Kazanmak",
      "subtitle":
          "Vücudumun kas oranını arttırmak,\nşekillendirmek istiyorum...",
      "page": HomeScreen(), // Kas kazanma sayfasına yönlendirin
    },
    {
      "image": "assets/images/formdakalgoal.png",
      "title": "Meditasyon & Yoga",
      "subtitle":
          "Ruhumu rahatlatmak,\nsakinleşmek ve yoga yapmak istiyorum...",
      "page": HomeScreen(), // Meditasyon & Yoga sayfasına yönlendirin
    },
    {
      "image": "assets/images/kilovermekgoal.png",
      "title": "Kilo Vermek",
      "subtitle": "Fazla kilolarımdan kurtulmak\nistiyorum...",
      "page": HomeScreen(), // Kilo verme sayfasına yönlendirin
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: CarouselSlider(
                items: goalArr
                    .map(
                      (gObj) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => gObj["page"],
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                // ignore: prefer_const_constructors
                                colors: TColor.primaryG,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: media.width * 0.12, horizontal: 35),
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Column(
                              children: [
                                Image.asset(
                                  gObj["image"].toString(),
                                  width: gObj["title"] == "Kilo Vermek"
                                      ? media.width *
                                          0.8 // Kilo Vermek için resim boyutunu büyütün
                                      : media.width *
                                          0.6, // Diğerleri için sabit boyut
                                  fit: BoxFit.fitWidth,
                                ),
                                SizedBox(
                                  height: media.width * 0.1,
                                ),
                                Text(
                                  gObj["title"].toString(),
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width: media.width * 0.2,
                                  height: 1,
                                  color: TColor.white,
                                ),
                                SizedBox(
                                  height: media.width * 0.04,
                                ),
                                Text(
                                  gObj["subtitle"].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: TColor.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 0.7,
                  initialPage: 0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  const Text(
                    "Hedefin Ne?",
                    style: TextStyle(
                        color: Color(0xFF1E236B),
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    "Hedefini seçmen seni daha doğru\nyönlendirmemizi sağlar...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 81, 85, 147), fontSize: 14),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
