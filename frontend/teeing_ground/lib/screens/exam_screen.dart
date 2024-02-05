import 'package:flutter/material.dart';

import 'package:teeing_ground/widgets/splitview_widget.dart';

class ExamScreen extends StatefulWidget {
  final int problemId;

  const ExamScreen({
    Key? key,
    required this.problemId,
  }) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState(
        problemId: problemId,
      );
}

class _ExamScreenState extends State<ExamScreen> {
  double leftWidth = MediaQueryData.fromView(
              WidgetsBinding.instance.platformDispatcher.views.single)
          .size
          .width /
      3;
  final int problemId;

  _ExamScreenState({required this.problemId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff464646),
        centerTitle: false,
        title: const Row(
          children: [
            Icon(
              Icons.golf_course_outlined,
              color: Colors.green,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Teeing\nGround",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Mansalva',
              ),
            ),
          ],
        ),
      ),
      body: VerticalSplitView(
        left: Container(
          color: Colors.green,
          child: Center(
            child: Text(
              "$problemId",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        right: Container(
          color: Colors.red,
          child: const Center(
            child: Text(
              "Right",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        ratio: 0.3,
      ),
    );
  }
}
