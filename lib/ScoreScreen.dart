import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  int? gender;
  int height;
  int weight;
  int age;

  final double bmiScore;

  String bmiStatus = "";

  ScoreScreen(
      {Key? key,
      required this.gender,
      required this.height,
      required this.weight,
      required this.age,
      required this.bmiScore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // surfaceTintColor: const Color.fromARGB(255, 176, 163, 212),
        title: const Text(" BMI Calculator "),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 163, 212),
      ),
      body: Container(
        color: const Color.fromARGB(255, 125, 128, 218),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //score circle -------------------------------------------------------------------------------
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 20, left: 20, right: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(250),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 78, 78, 78),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                            offset: const Offset(
                              0.0,
                              0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          bmiScore.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 70),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text("BMI Score :" + setBmiInterpretation(bmiScore)),
                      ],
                    ),
                  ],
                ),
              ),
              //gender and age indicateurs
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 78, 78, 78),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                              offset: const Offset(
                                0.0,
                                0.0,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            gender == 0
                                ? const Icon(
                                    Icons.male,
                                    size: 50,
                                  )
                                : const Icon(Icons.female, size: 50),
                            const SizedBox(height: 10),
                            gender == 0
                                ? const Text(
                                    "Male",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                  )
                                : const Text(
                                    "Female",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                  )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 78, 78, 78),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                              offset: const Offset(
                                0.0,
                                0.0,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.calendar_month, size: 50),
                            const SizedBox(height: 10),
                            Text(
                              age.toString() + " years",
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //height and weight indicateurs
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 78, 78, 78),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                              offset: const Offset(
                                0.0,
                                0.0,
                              ),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Icon(
                                Icons.height,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                height.toString() + " cm",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 78, 78, 78),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                              offset: const Offset(
                                0.0,
                                0.0,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString() + " KG",
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            const Icon(
                              Icons.scale,
                              size: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData genderIcon(gender) {
    return gender == 0 ? Icons.male : Icons.female;
  }

  String setBmiInterpretation(bmiScore) {
    if (bmiScore > 30) {
      bmiStatus = " Obese";
    } else if (bmiScore >= 25) {
      bmiStatus = " Overweight";
    } else if (bmiScore >= 18.5) {
      bmiStatus = " Normal";
    } else if (bmiScore < 18.5) {
      bmiStatus = " Underweight";
    }
    return bmiStatus;
  }
}
