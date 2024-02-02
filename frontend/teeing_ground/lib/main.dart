// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:teeing_ground/data.dart';

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
    List<TableRow> rows = [];
    const double mobileWidth = 700;
    const double breakPointWidth = 1200;
    // double pageWidth =
    // MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
    bool isWeb = true;
    double pageWidth = MediaQuery.of(context).size.width;
    isWeb = pageWidth > mobileWidth ? true : false;
    // rows = data
    //     .map(
    //       (e) => TableRow(
    //         status: e[0] as bool,
    //         problem: e[1] as String,
    //         difficulty: e[2] as String,
    //         tag: e[3] as String,
    //         color: if
    //       ),
    //     )
    //     .toList();
    for (final (index, item) in data.indexed) {
      rows.add(
        TableRow(
          status: item[0] as bool,
          problem: item[1] as String,
          difficulty: item[2] as String,
          tag: item[3] as String,
          color: index.isEven
              ? const Color.fromARGB(255, 34, 34, 34)
              : const Color.fromARGB(255, 51, 51, 51),
        ),
      );
    }

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
          Row(
            children: [
              SizedBox(
                width: pageWidth > breakPointWidth
                    ? (pageWidth - breakPointWidth) / 2 + 13
                    : 13,
              ),
              Expanded(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            "제출여부",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 15,
                          child: Text(
                            "문제",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            "난이도",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            "태그",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 182, 182, 182),
                    ),
                    for (var row in rows) row,
                  ],
                ),
              ),
              SizedBox(
                width: pageWidth > breakPointWidth
                    ? (pageWidth - breakPointWidth) / 2 + 13
                    : 13,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TableRow extends StatelessWidget {
  final bool status;
  final String problem, difficulty, tag;
  final Color color;

  const TableRow({
    Key? key,
    required this.status,
    required this.problem,
    required this.difficulty,
    required this.tag,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 40,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 5,
            child: status
                ? const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  )
                : const Icon(null),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Text(
              problem,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 5,
            child: Text(
              difficulty,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 5,
            child: Text(
              tag,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
