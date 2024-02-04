// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class VerticalSplitView extends StatefulWidget {
  final Widget left;
  final Widget right;
  final double ratio;

  const VerticalSplitView({
    Key? key,
    required this.left,
    required this.right,
    required this.ratio,
  }) : super(key: key);

  @override
  State<VerticalSplitView> createState() => _VerticalSplitViewState();
}

class _VerticalSplitViewState extends State<VerticalSplitView> {
  final _dividerWidth = 10.0;

  double _ratio = 0.3;
  double _maxWidth = 300;

  get _width1 => _ratio * _maxWidth;

  get _width2 => (1 - _ratio) * _maxWidth;

  @override
  void initState() {
    super.initState();
    _ratio = widget.ratio;
  }

  @override
  Widget build(BuildContext context) {
    // Color dividerColor =
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        assert(_ratio <= 1);
        assert(_ratio >= 0);
        _maxWidth ??= constraints.maxWidth - _dividerWidth;
        if (_maxWidth != constraints.maxWidth) {
          _maxWidth = constraints.maxWidth - _dividerWidth;
        }

        return SizedBox(
          width: constraints.maxWidth,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: _width1,
                child: widget.left,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeColumn,
                  child: SizedBox(
                    width: _dividerWidth,
                    height: constraints.maxHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: const RotationTransition(
                        turns: AlwaysStoppedAnimation(0.25),
                        child: Icon(Icons.drag_handle),
                      ),
                    ),
                  ),
                ),
                onPanUpdate: (DragUpdateDetails details) {
                  setState(
                    () {
                      _ratio += details.delta.dx / _maxWidth;
                      if (_ratio > 1) {
                        _ratio = 1;
                      } else if (_ratio < 0.0) _ratio = 0.0;
                    },
                  );
                },
              ),
              SizedBox(
                width: _width2,
                child: widget.right,
              ),
            ],
          ),
        );
      },
    );
  }
}
