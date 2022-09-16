import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomSwitchButton extends StatefulWidget {
  bool isChecked;
  VoidCallback onTap;
  CustomSwitchButton({Key? key, required this.isChecked, required this.onTap}) : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFE9ECF5);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            height: 40,
            width: 70,
            decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.white, offset: Offset(-4, -4), inset: false), BoxShadow(blurRadius: 8, color: Color(0xFFA7A9AF), offset: Offset(3, 3), inset: false)],
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  boxShadow: !widget.isChecked
                      ? const [
                          BoxShadow(blurRadius: 2, color: Colors.white, offset: Offset(-2, -2), inset: true),
                          BoxShadow(blurRadius: 2, color: Color(0xFFA7A9AF), offset: Offset(2, 2), inset: true),
                        ]
                      : null,
                  gradient: widget.isChecked ? const LinearGradient(colors: [Colors.red, Colors.amber], begin: Alignment.topCenter, end: Alignment.bottomCenter) : null,
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment: widget.isChecked ? const Alignment(1, 0) : const Alignment(-1, 0),
                    duration: const Duration(milliseconds: 100),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 30,
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            boxShadow: const [
                              /* BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.white,
                                  offset: Offset(-4, -4),
                                  inset: false),*/
                              BoxShadow(blurRadius: 5, color: Color(0xFFA7A9AF), offset: Offset(3, 0), inset: false)
                            ],
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
