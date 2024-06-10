import 'package:flutter/material.dart';
import '../common/colo_extension.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WorkoutDetailView extends StatelessWidget {
  final String title;
  final List<Map<String, String>> exercises;

  const WorkoutDetailView({
    required this.title,
    required this.exercises,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primaryColor3,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: TColor.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.donut_large,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E236B),
              Color.fromARGB(196, 93, 99, 187),
              Color(0xFF1E236B),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/welcome.jpeg",
                width: media.width,
                height: media.width * 0.55,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    IgnorePointer(
                      ignoring: true,
                      child: RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: TColor.primary,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 5.2,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: exercises.length,
                  physics:
                      NeverScrollableScrollPhysics(), // Otomatik yukarı kaydırmayı engeller
                  itemBuilder: (context, index) {
                    var wObj = exercises[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              wObj["image"].toString(),
                              width: media.width,
                              height: media.width * 0.4,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                wObj["name"]!,
                                style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
