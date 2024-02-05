import 'package:flutter/material.dart';

class TableRow extends StatelessWidget {
  final bool status;
  final int id;
  final String problem, difficulty, tag;
  final Color color;

  const TableRow({
    Key? key,
    required this.status,
    required this.id,
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
            flex: 2,
            child: status
                ? const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      size: 18,
                      Icons.check_circle_rounded,
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
              style: TextStyle(
                color: difficulty == "쉬움"
                    ? Colors.green
                    : difficulty == "보통"
                        ? Colors.yellow
                        : Colors.red,
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
