import 'package:flutter/material.dart';
import '../common/colo_extension.dart';
import '../common_widg/round_button.dart';
import 'tab_button.dart';
import 'workoutdetail.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int isActiveTab = 0;

  final Map<String, List<Map<String, String>>> exerciseDetails = {
    "Karın": [
      {"name": "Diz-Çekme", "image": "assets/images/Diz-Çekmekarın.png"},
      {
        "name": "Crunch Machine",
        "image": "assets/images/Crunch Machinekarın.png"
      },
      {"name": "Crunch", "image": "assets/images/Crunchkarın.png"},
      {"name": "Twist", "image": "assets/images/Twistkarın.png"},
      {
        "name": "Wheel_RollOut",
        "image": "assets/images/Wheel_RollOutkarın.png"
      },
    ],
    "Göğüs": [
      {"name": "Bench Press", "image": "assets/images/Bench_Pressgöğüs.png"},
      {"name": "Cable Fly", "image": "assets/images/Cable_Flygöğüs.png"},
      {"name": "Dumbbel Fly", "image": "assets/images/DB_Flygöğüs.png"},
      {"name": "Dumbbel Press", "image": "assets/images/DB_Pressgöğüs.png"},
      {"name": "Push Up", "image": "assets/images/PushUpgöğüs.png"},
      {"name": "Machine Fly", "image": "assets/images/Machine_Flygöğüs.png"}
    ],
    "Kol": [
      {"name": "Bench Dips", "image": "assets/images/Bench_dipskol.png"},
      {"name": "Biceps Curl", "image": "assets/images/Biceps_Curlkol.png"},
      {
        "name": "Cable PushDown",
        "image": "assets/images/Cable_Pushdownkol.png"
      },
      {
        "name": "Concentration Curl",
        "image": "assets/images/Concentration_Curlkol.png"
      },
      {"name": "Hammer Curl", "image": "assets/images/Hammer_Curlkol.png"},
      {"name": "Preacher Curl", "image": "assets/images/Preacher_Curlkol.png"},
    ],
    "Bacak": [
      {
        "name": "Dumbbel Squat 2",
        "image": "assets/images/DB_Squat-1,2bacak.png"
      },
      {"name": "Dumbbel Squat 1", "image": "assets/images/DB_Squat-1bacak.png"},
      {"name": "Hip Thrust", "image": "assets/images/Hip_Thrustbacak.png"},
      {
        "name": "Hip Adduction",
        "image": "assets/images/Hip Adductionbacak.png"
      },
      {
        "name": "Leg Extension",
        "image": "assets/images/Leg Extensionbacak.png"
      },
      {"name": "Leg Curl", "image": "assets/images/Leg_Curlbacak.png"},
      {"name": "Lunges", "image": "assets/images/Lungesbacak.png"},
      {"name": "Squat", "image": "assets/images/Squatbacak.png"},
    ],
  };

  List workArr = [
    {
      "name": "Karın",
      "image": "assets/images/Abdomen.jpeg",
      "subtitle": "Bel bölgenizde daha fazla şekil ve kas için..."
    },
    {
      "name": "Göğüs",
      "image": "assets/images/göğüs.jpeg",
      "subtitle": "Daha sert bir göğüs..."
    },
    {
      "name": "Kol",
      "image": "assets/images/Arm.jpeg",
      "subtitle": "Sağlam ve güçlü kollar için..."
    },
    {
      "name": "Bacak",
      "image": "assets/images/Leg.jpeg",
      "subtitle": "Daha dengeli ve güçlü bacaklar..."
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Egzersizler",
          style: TextStyle(
              color: TColor.primaryColor2,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: TColor.white, boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
            ]),
            child: Row(
              children: [
                Expanded(
                  child: TabButton(
                    title: "Tüm Vücut",
                    isActive: isActiveTab == 0,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TabButton(
                    title: "Kardiyo",
                    isActive: isActiveTab == 3,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 3;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TabButton(
                    title: "Fit Yemek",
                    isActive: isActiveTab == 1,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                itemCount: workArr.length,
                itemBuilder: (context, index) {
                  var wObj = workArr[index] as Map? ?? {};
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: media.width * 0.5,
                    decoration: BoxDecoration(
                        color: TColor.gray,
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Image.asset(
                          wObj["image"].toString(),
                          width: media.width,
                          height: media.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: media.width,
                          height: media.width * 0.5,
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.black.withOpacity(0.7)
                                : TColor.gray.withOpacity(0.35),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wObj["name"],
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                wObj["subtitle"],
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      height: 25,
                                      child: RoundButton(
                                        title: "İlerle",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        onPressed: () {
                                          String category = wObj["name"];
                                          List<Map<String, String>> exercises =
                                              exerciseDetails[category]!;
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  WorkoutDetailView(
                                                title: category,
                                                exercises: exercises,
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
