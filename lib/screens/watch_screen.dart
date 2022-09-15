import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../custom_widget/custom_switch_button.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  TextEditingController hourController = TextEditingController();
  TextEditingController minController = TextEditingController();
  bool isBack = true;
  bool isDayClick = true;
  bool isChecked = false;
  bool isSetting = true;
  bool isEnter = false;
  DateTime? dateTime;
  Timer? timer;
  List<Days> daysList = [
    Days("Sunday", false),
    Days("Monday", false),
    Days("Tuesday", false),
    Days("Wednesday", false),
    Days("Thursday", false),
    Days("Friday", false),
    Days("Saturday", false),
  ];
  List<Alarm> alarmList = [
    Alarm(
        "7:30",
        "Hello",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "8:30",
        "Wake up",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "6:30",
        "Good Morning",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "7:00",
        "hii",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "8:00",
        "tea time",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "5:30",
        "message",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "6:00",
        "early morning",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
  ];

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  void stopTimer() {
    timer!.cancel();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //  final hour = dateTime.hour.toDouble();
    //final angle = (-pi * (hour / -60)) * 2;
    //  dateTime = DateTime.now();
    const backgroundColor = Color(0xFFE9ECF5);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (hourController.text.isEmpty && minController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Please enter Time");
          } else {
            Fluttertoast.showToast(msg: "Your Alarm is set");
          }

          setState(() {
            dateTime = null;
            hourController.clear();
            minController.clear();
          });

          startTimer();
        },
        child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.amber],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              boxShadow: [
                BoxShadow(
                    blurRadius: 13.0,
                    color: Colors.redAccent,
                    offset: Offset(3, 1),
                    inset: false)
              ],
            ),
            child: const Icon(
              Icons.add,
              size: 40,
            )),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isBack = !isBack;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: isBack ? 3.0 : 15.0,
                                color: Colors.white,
                                offset: isBack
                                    ? const Offset(-2, -2)
                                    : const Offset(-8, -8),
                                inset: isBack),
                            BoxShadow(
                                blurRadius: isBack ? 3.0 : 20.0,
                                color: const Color(0xFFA7A9AF),
                                offset: isBack
                                    ? const Offset(2, 2)
                                    : const Offset(8, 8),
                                inset: isBack)
                          ]),
                      child: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSetting = !isSetting;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: isSetting ? 3.0 : 15.0,
                                color: Colors.white,
                                offset: isSetting
                                    ? const Offset(-2, -2)
                                    : const Offset(-8, -8),
                                inset: isSetting),
                            BoxShadow(
                                blurRadius: isSetting ? 3.0 : 20.0,
                                color: const Color(0xFFA7A9AF),
                                offset: isSetting
                                    ? const Offset(2, 2)
                                    : const Offset(8, 8),
                                inset: isSetting)
                          ]),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            DefaultTabController(
              length: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 20,
                            color: Colors.white,
                            offset: Offset(-5, -5)),
                        BoxShadow(
                            blurRadius: 20,
                            color: Color(0xFFA7A9AF),
                            offset: Offset(8, 8))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TabBar(
                          controller: tabController,
                          indicator: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.white,
                                    offset: Offset(-3, -3),
                                    inset: true),
                                BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0xFFA7A9AF),
                                    offset: Offset(3, 3),
                                    inset: true)
                              ]),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.black,
                          tabs: const [
                            Tab(
                              text: "Watch",
                            ),
                            Tab(
                              text: "Alarm",
                            ),
                            Tab(
                              text: "Stopwatch",
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                (MediaQuery.of(context).size.width * 0.85) / 2),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 15,
                                  color: Colors.white,
                                  offset: Offset(-5, -5),
                                  inset: false),
                              BoxShadow(
                                  blurRadius: 15,
                                  color: Color(0xFFA7A9AF),
                                  offset: Offset(5, 5),
                                  inset: false),
                            ]),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.85,
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.white,
                                    offset: Offset(-3, -3),
                                    inset: true),
                                BoxShadow(
                                    blurRadius: 8,
                                    color: Color(0xFFA7A9AF),
                                    offset: Offset(4, 4),
                                    inset: true),
                              ],
                              borderRadius: BorderRadius.circular(
                                  (MediaQuery.of(context).size.width * 0.85) /
                                      2)),
                          child: Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.85,
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 20,
                                            color: Colors.white,
                                            offset: Offset(-5, -5),
                                            inset: false),
                                        BoxShadow(
                                            blurRadius: 20,
                                            color: Color(0xFFA7A9AF),
                                            offset: Offset(5, 5),
                                            inset: false),
                                      ],
                                      borderRadius: BorderRadius.circular(
                                          (MediaQuery.of(context).size.width *
                                                  0.85) /
                                              2)),
                                ),
                                Transform.rotate(
                                  angle: pi / 2,
                                  child: Container(
                                    constraints: const BoxConstraints.expand(),
                                    child: CustomPaint(
                                      painter: ClockPainter(
                                          context, dateTime ?? DateTime.now()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                (MediaQuery.of(context).size.width * 0.85) / 2),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 15,
                                  color: Colors.white,
                                  offset: Offset(-5, -5),
                                  inset: false),
                              BoxShadow(
                                  blurRadius: 15,
                                  color: Color(0xFFA7A9AF),
                                  offset: Offset(5, 5),
                                  inset: false),
                            ]),
                        child: Container(
                          height: 70,
                          width: 180,
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.white,
                                    offset: Offset(-3, -3),
                                    inset: true),
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0xFFA7A9AF),
                                    offset: Offset(3, 3),
                                    inset: true),
                              ],
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 22.0),
                                child: SizedBox(
                                  width: 70,
                                  child: TextFormField(
                                    maxLength: 2,
                                    controller: hourController,
                                    textAlign: TextAlign.center,
                                    onFieldSubmitted: (value) {
                                      stopTimer();
                                      setState(() {
                                        isEnter = true;
                                        dateTime = DateFormat("hh : mm").parse(
                                            "${hourController.text} : ${minController.text}");
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: '',
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 45,
                                            color: Colors.grey),
                                        hintText: "00"),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                              const Text(
                                ":",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.black54),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 22.0),
                                child: SizedBox(
                                  width: 70,
                                  child: TextFormField(
                                    controller: minController,
                                    maxLength: 2,
                                    textAlign: TextAlign.center,
                                    onFieldSubmitted: (value) {
                                      stopTimer();
                                      setState(() {
                                        isEnter = true;
                                        dateTime = DateFormat("hh : mm").parse(
                                            "${hourController.text} : ${minController.text}");
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 45,
                                            color: Colors.grey),
                                        hintText: "00"),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Please ! Enter Time in 24 hours",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                            itemCount: daysList.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final item = daysList[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 30.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item.isClick = !item.isClick!;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius:
                                                  item.isClick! ? 3.0 : 10.0,
                                              color: Colors.white,
                                              offset: item.isClick!
                                                  ? const Offset(-2, -2)
                                                  : const Offset(-3, -3),
                                              inset: item.isClick!),
                                          BoxShadow(
                                              blurRadius:
                                                  item.isClick! ? 3.0 : 20.0,
                                              color: const Color(0xFFA7A9AF),
                                              offset: item.isClick!
                                                  ? const Offset(2, 2)
                                                  : const Offset(8, 8),
                                              inset: item.isClick!)
                                        ]),
                                    child: Center(child: Text(item.day!)),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: ListView.builder(
                      itemCount: alarmList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, int mainIndex) {
                        final item = alarmList[mainIndex];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 15,
                                      color: Colors.white,
                                      offset: Offset(-3, -3)),
                                  BoxShadow(
                                      blurRadius: 20,
                                      color: Color(0xFFA7A9AF),
                                      offset: Offset(8, 8))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.time!,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    Text(item.text!),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: ListView.builder(
                                          itemCount: alarmList[mainIndex]
                                              .dayList
                                              .length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            final data = alarmList[mainIndex]
                                                .dayList[index];
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    data.isClick =
                                                        !data.isClick!;
                                                  });
                                                },
                                                child: Text(
                                                  data.day!,
                                                  style: TextStyle(
                                                      color: data.isClick ==
                                                              true
                                                          ? Colors.deepOrange
                                                          : Colors.black),
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 70,
                                  child: CustomSwitchButton(
                                      isChecked:
                                          alarmList[mainIndex].isChecked!),
                                ),
                                /* FlutterSwitch(
                                    activeColor: Colors.black,
                                    value: alarmList[mainIndex].isChecked!,
                                    onToggle: (val) {
                                      setState(() {
                                        alarmList[mainIndex].isChecked = val;
                                      });
                                    })*/
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class Alarm {
  final String? time;
  final String? text;
  bool? isChecked;
  final List<Days> dayList;

  Alarm(this.time, this.text, this.dayList, this.isChecked);
}

class Days {
  final String? day;
  bool? isClick;

  Days(this.day, this.isClick);
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);
    Offset center = Offset(centerX, centerY);
    double outerRadius = radius - 10;
    double innerRadius = radius - 20;
    int hours = dateTime.hour;
    int minutes = dateTime.minute;
    Path path = Path();

    // print(dateTime);
    // print(dateTime.timeZoneOffset.inHours);
    // print(dateTime.hour);
    // print(dateTime.minute);
    // print(dateTime.second);

    double hourX = centerX -
        outerRadius *
            0.6 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY -
        outerRadius *
            0.6 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double minX =
        centerX - outerRadius * 0.7 * cos(dateTime.minute * 6 * pi / 180);
    double minY =
        centerX - outerRadius * 0.7 * sin(dateTime.minute * 6 * pi / 180);
    double secX =
        centerX - outerRadius * 0.8 * cos(dateTime.second * 6 * pi / 180);
    double secY =
        centerX - outerRadius * 0.8 * sin(dateTime.second * 6 * pi / 180);

    Paint minLinePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    Paint blurMinLinePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 8
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, (8))
      ..strokeCap = StrokeCap.round;
    Paint secLinePaint = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    Paint roundPaint = Paint()..color = const Color(0xFFE9ECF5);
    Paint blurRoundPaint = Paint()
      ..color = Colors.grey
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, (5));
    Paint innerRoundPaint = Paint()..color = Colors.red;

    // print("date & time1 : $hourX");
    // print("date & time2 : $hourY");
    // print("date & time3 : $minX");
    // print("date & time4 : $minY");

    /* canvas.rotate(dateTime.hour > 12
        ? 2 * pi * ((hours - 12) / 12 + (minutes / 720))
        : 2 * pi * ((hours - 12) + (minutes / 720)));*/
    // canvas.drawLine(center, Offset(hourX, hourY), blurMinLinePaint);
    canvas.drawLine(center, Offset(hourX, hourY), minLinePaint);
    // canvas.drawLine(center, Offset(minX, minY), blurMinLinePaint);
    canvas.drawLine(center, Offset(minX, minY), minLinePaint);
    canvas.drawLine(center, Offset(secX, secY), secLinePaint);
    canvas.drawCircle(center, 20, blurRoundPaint);
    canvas.drawCircle(center, 20, roundPaint);
    canvas.drawCircle(center, 10, innerRoundPaint);

    for (int i = 0; i < 360; i += 30) {
      double x1 = centerX - radius * cos(i * pi / 180);
      double y1 = centerX - radius * sin(i * pi / 180);

      double x2 = centerX - 110 * cos(i * pi / 180);
      double y2 = centerX - 110 * sin(i * pi / 180);

      canvas.drawCircle(Offset(x2, y2), 3, Paint()..color = Colors.grey);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
