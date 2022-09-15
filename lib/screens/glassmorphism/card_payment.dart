import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neumorohism_app/screens/glassmorphism/navigation_page.dart';

class CardPayment extends StatefulWidget {
  const CardPayment({Key? key}) : super(key: key);

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  int selectedIndex = 0;
  List priceList = [
    '10',
    '50',
    '100',
    '200',
    '500',
    '1000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/demo1.jpeg"),
                    fit: BoxFit.cover)),
            height: MediaQuery.of(context).size.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white10),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Center(
                  child: Text(
                    "Instant",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                const Center(
                  child: Text(
                    "Top up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  //height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.height * 0.4,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.white30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "1092",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "2384",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "3474",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "8939",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "07/25",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "JONA SMITH",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.deepPurple
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.amber,
                                            Colors.deepOrange
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight)),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Select Amount",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 8 / 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemCount: priceList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final equal = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: equal ? Color(0xFF2A61C4) : null,
                              borderRadius: BorderRadius.circular(30),
                              border: equal
                                  ? null
                                  : Border.all(color: Colors.white, width: 2)),
                          child: Center(
                              child: Text(
                            "\$${priceList[index]}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: TextFormField(
                      textAlign: TextAlign.center,
                      showCursor: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Or, Type of amount",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavigationPage()));
                    },
                    child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Colors.cyan, Colors.deepPurple],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: const Center(
                          child: Text(
                            "Pay Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
