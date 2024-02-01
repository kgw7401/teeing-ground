import 'package:flutter/material.dart';

class Problems extends StatelessWidget {
  const Problems({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text(
            '제출여부',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            '문제',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            '난이도',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
      rows: const [],
    );
  }
}
