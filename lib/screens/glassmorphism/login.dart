import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neumorohism_app/screens/glassmorphism/navigation_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    "Welcome",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                const Center(
                  child: Text(
                    "Back",
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
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(colors: [
                        Colors.cyan,
                        Colors.deepPurple,
                        Colors.pinkAccent,
                        Colors.orangeAccent
                      ], startAngle: 0, endAngle: 5),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            colors: [Colors.cyan, Colors.deepPurple],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your Email",
                              hintStyle: TextStyle(color: Colors.white38),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              )),
                        ),
                        const Divider(
                          color: Colors.white,
                          indent: 10,
                          endIndent: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your Password",
                              hintStyle: TextStyle(
                                  color: Colors.white38, fontSize: 20),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "here",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
