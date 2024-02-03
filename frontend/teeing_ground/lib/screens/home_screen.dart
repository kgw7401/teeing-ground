import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:teeing_ground/data/data.dart';
import 'package:teeing_ground/widgets/tablerow_widget.dart' as tablerow;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<tablerow.TableRow> rows = createData();
  double breakPointWidth = 1200;
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    var pages = List.generate(
      rows.length,
      (index) => Column(
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
                          flex: 2,
                          child: Text(
                            "제출여부",
                            overflow: TextOverflow.ellipsis,
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
                    for (var row in rows.sublist(
                        currentPage * 25,
                        currentPage != rows.length ~/ 25
                            ? (currentPage + 1) * 25
                            : rows.length))
                      row,
                    const SizedBox(
                      height: 25,
                    ),
                    NumberPaginator(
                      numberPages: rows.length ~/ 25 == 0
                          ? rows.length ~/ 25
                          : rows.length ~/ 25 + 1,
                      initialPage: currentPage,
                      showPrevButton: false,
                      showNextButton: false,
                      config: NumberPaginatorUIConfig(
                        buttonShape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        buttonSelectedForegroundColor: Colors.green[900],
                        buttonSelectedBackgroundColor: Colors.green[200],
                        buttonUnselectedForegroundColor: Colors.white,
                        buttonUnselectedBackgroundColor: null,
                      ),
                      onPageChange: (int pageNumber) {
                        setState(
                          () {
                            currentPage = pageNumber;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
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
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1A),
      body: SingleChildScrollView(
        child: pages[currentPage],
      ),
    );
  }
}
