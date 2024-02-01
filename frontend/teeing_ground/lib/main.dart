import 'package:flutter/material.dart';
import 'package:teeing_ground/problems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  // TODO: https://medium.com/doohyeon-kim/flutter-responsive-web-c2c123c0d5d1
  @override
  Widget build(BuildContext context) {
    const double mobileWidth = 700;
    const double breakPointWidth = 1200;
    double pageWidth =
        MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
    bool isWeb = true;
    double a = pageWidth > breakPointWidth
        ? (pageWidth - breakPointWidth) / 2 + 20
        : 20;
    pageWidth = MediaQuery.of(context).size.width;
    isWeb = pageWidth > mobileWidth ? true : false;
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1A),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 45,
            color: const Color(0xff464646),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: pageWidth > breakPointWidth
                          ? (pageWidth - breakPointWidth) / 2 + 13
                          : 13,
                    ),
                    const Icon(
                      Icons.golf_course_outlined,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Teeing\nGround",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Mansalva',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: pageWidth > breakPointWidth
                      ? (pageWidth - breakPointWidth) / 2 + 13
                      : 13,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            "aaaaa",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: const Padding(
      //     padding: EdgeInsets.all(8.0),
      //     child: Row(
      //       children: [
      //         SizedBox(
      //           width: 200,
      //         ),
      //         Icon(
      //           Icons.golf_course_outlined,
      //           color: Colors.green,
      //         ),
      //       ],
      //     ),
      //   ),
      //   centerTitle: false,
      //   elevation: 1,
      //   backgroundColor: Colors.black87,
      // ),
    );
  }
}
