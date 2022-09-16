import 'package:flutter/material.dart';
import 'package:neumorohism_app/providers/alarm_provider.dart';
import 'package:provider/provider.dart';

import '../custom_widget/custom_switch_button.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final alarmList = context.read<AlarmProvider>().alarmList;
    const backgroundColor = Color(0xFFE9ECF5);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: ListView.builder(
            itemCount: alarmList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, int mainIndex) {
              final item = alarmList[mainIndex];
              print(item.isChecked!);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius: 15, color: Colors.white, offset: Offset(-3, -3)), BoxShadow(blurRadius: 20, color: Color(0xFFA7A9AF), offset: Offset(8, 8))]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.time!, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          Text(item.text!),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                                itemCount: alarmList[mainIndex].dayList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final data = alarmList[mainIndex].dayList[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          data.isClick = !data.isClick!;
                                        });
                                      },
                                      child: Text(
                                        data.day!,
                                        style: TextStyle(color: data.isClick == true ? Colors.deepOrange : Colors.black),
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
                          isChecked: item.isChecked!,
                          onTap: () {
                            setState(() {
                              item.isChecked = !item.isChecked!;
                            });
                          },
                        ),
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
