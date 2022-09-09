import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../custom_widget/custom_switch_button.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  bool isBack = true;
  bool isChecked = false;
  bool isSetting = true;
  List<Days> dayList = [
    Days("su", false),
    Days("mo", false),
    Days("tu", false),
    Days("we", false),
    Days("th", false),
    Days("fr", false),
    Days("sa", false),
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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFE9ECF5);
    return Scaffold(
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
                Container(),
                ListView.builder(
                    itemCount: alarmList.length,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
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
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        itemCount:
                                            alarmList[mainIndex].dayList.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          final data = alarmList[mainIndex]
                                              .dayList[index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            child: Text(data.day!),
                                          );
                                        }),
                                  )
                                ],
                              ),
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  CustomSwitchButton(
                                      isChecked:
                                          alarmList[mainIndex].isChecked!),
                                ],
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
  final bool? isClick;

  Days(this.day, this.isClick);
}
