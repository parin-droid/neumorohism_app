import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';

class TradePage extends StatefulWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  List<Trade> TradeList = [
    Trade("ABC", 2.500, 300.00, true),
    Trade("DEF", 925, 75.00, false),
    Trade("GHI", 1200, 150.00, false),
    Trade("JKL", 350, 125.00, true)
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
                    "Trade",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                const Center(
                  child: Text(
                    "Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    itemCount: TradeList.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = TradeList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 15.0),
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item.value.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "stock name",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      item.isPlus == true
                                          ? const Text(
                                              "+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          : const Text(
                                              "-",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                      Text(
                                        item.profit.toString(),
                                        style: TextStyle(
                                            color: item.isPlus == true
                                                ? Colors.white
                                                : Colors.red,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.37,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Colors.cyan, Colors.deepPurple],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: const Center(
                          child: Text(
                            "Buy",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.37,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Colors.cyan, Colors.deepPurple],
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft)),
                        child: const Center(
                          child: Text(
                            "Sell",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Trade {
  final String? name;
  final double? value;
  final double? profit;
  final bool? isPlus;

  Trade(this.name, this.value, this.profit, this.isPlus);
}
