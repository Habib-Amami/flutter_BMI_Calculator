import 'package:flutter/material.dart';
import 'ScoreScreen.dart';
import 'dart:math';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});
  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int? _gender;
  int _height = 50;
  int _weight = 1;
  int _age = 1;
  bool _isFinished = false;
  double _bmiScore = 0;

  final ChoiceChip3DStyle selectedStyle =
      ChoiceChip3DStyle(topColor: Colors.grey[200]!, backColor: Colors.grey);

  final ChoiceChip3DStyle unselectedStyle =
      ChoiceChip3DStyle(topColor: Colors.white, backColor: Colors.grey[300]!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // surfaceTintColor: const Color.fromARGB(255, 176, 163, 212),
          title: const Text(" BMI Calculator "),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 176, 163, 212),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 125, 128, 218),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //geneder selection section--------------------------------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //male selection (if male selected set _gender to 0)
                        Material(
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                          child: ChoiceChip3D(
                              selected: _gender == 0,
                              onSelected: () {
                                setState(() {
                                  _gender = 0;
                                });
                              },
                              style: _gender == 0
                                  ? selectedStyle
                                  : unselectedStyle,
                              onUnSelected: () {},
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.male),
                                  Text("male"),
                                ],
                              )),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        //female selection (if selected set _gender to 1)
                        Material(
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                          child: ChoiceChip3D(
                              selected: _gender == 1,
                              onSelected: () {
                                setState(() {
                                  _gender = 1;
                                });
                              },
                              style: _gender == 1
                                  ? selectedStyle
                                  : unselectedStyle,
                              onUnSelected: () {},
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.female),
                                  Text("female"),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  //height selection section----------------------------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      color: const Color.fromARGB(255, 176, 163, 212),
                      elevation: 8,
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 15.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  alignment: Alignment.center,
                                  height: 40,
                                ),
                                Positioned(
                                    child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 15.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                NumberPicker(
                                  itemHeight: 45,
                                  itemWidth: 45,
                                  itemCount: 7,
                                  step: 1,
                                  minValue: 50,
                                  maxValue: 250,
                                  value: _height,
                                  onChanged: (value) {
                                    setState(() {
                                      _height = value;
                                    });
                                  },
                                  axis: Axis.horizontal,
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  highlightColor: Colors.red,
                                  icon: const Icon(Icons.remove),
                                  onPressed: () => setState(() {
                                    _height = _height - 1;
                                  }),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text('Your height : $_height cm',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  highlightColor: Colors.red,
                                  icon: const Icon(Icons.add),
                                  onPressed: () => setState(() {
                                    _height = _height + 1;
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //age and weight sections ----------------------------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //weight section ------------------------------------------------------------------------
                        Material(
                          color: const Color.fromARGB(255, 176, 163, 212),
                          elevation: 8,
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Text("Your Weight (KG) :",
                                    style: TextStyle(color: Colors.white)),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                        vertical: 15.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                      ),
                                      alignment: Alignment.center,
                                      height: 210,
                                      width: 40,
                                    ),
                                    Positioned(
                                        child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 15.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(
                                              0.0,
                                              0.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                    NumberPicker(
                                      itemHeight: 45,
                                      itemWidth: 45,
                                      itemCount: 5,
                                      step: 1,
                                      minValue: 1,
                                      maxValue: 250,
                                      value: _weight,
                                      onChanged: (value) {
                                        setState(() {
                                          _weight = value;
                                        });
                                      },
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      highlightColor: Colors.red,
                                      icon: const Icon(Icons.remove),
                                      onPressed: () => setState(() {
                                        _weight = _weight - 1;
                                      }),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    IconButton(
                                      highlightColor: Colors.red,
                                      icon: const Icon(Icons.add),
                                      onPressed: () => setState(() {
                                        _weight = _weight + 1;
                                      }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 75,
                        ),
                        //age section----------------------------------------------------------------------------------
                        Material(
                          color: const Color.fromARGB(255, 176, 163, 212),
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Text("Your Age :",
                                    style: TextStyle(color: Colors.white)),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                        vertical: 15.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                      ),
                                      alignment: Alignment.center,
                                      height: 210,
                                      width: 40,
                                    ),
                                    Positioned(
                                        child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 15.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(
                                              0.0,
                                              0.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                    NumberPicker(
                                      itemHeight: 45,
                                      itemWidth: 45,
                                      itemCount: 5,
                                      step: 1,
                                      minValue: 1,
                                      maxValue: 150,
                                      value: _age,
                                      onChanged: (value) {
                                        setState(() {
                                          _age = value;
                                        });
                                      },
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      highlightColor: Colors.red,
                                      icon: const Icon(Icons.remove),
                                      onPressed: () => setState(() {
                                        _age = _age - 1;
                                      }),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    IconButton(
                                      highlightColor: Colors.red,
                                      icon: const Icon(Icons.add),
                                      onPressed: () => setState(() {
                                        _age = _age + 1;
                                      }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //claculation button
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        height: 60,
                        width: 300,
                        child: SwipeableButtonView(
                          isFinished: _isFinished,
                          buttonText: "CALCULATE",
                          buttonWidget: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                          activeColor: const Color.fromARGB(255, 176, 163, 212),
                          onFinish: () async {
                            await Navigator.push(
                                context,
                                PageTransition(
                                    child: ScoreScreen(
                                      gender: _gender,
                                      height: _height,
                                      weight: _weight,
                                      age: _age,
                                      bmiScore: _bmiScore,
                                    ),
                                    type: PageTransitionType.fade));

                            setState(() {
                              _isFinished = false;
                            });
                          },
                          onWaitingProcess: () {
                            //calculate BMI here
                            calculateBmi();
                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                _isFinished = true;
                              });
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
