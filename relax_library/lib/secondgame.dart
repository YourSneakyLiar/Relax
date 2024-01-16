import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SecondGame extends StatefulWidget {
  @override
  _SecondGameState createState() => _SecondGameState();
}

class _SecondGameState extends State<SecondGame> {
  final List<GlobalKey<_DraggableShapeState>> keys = List.generate(4, (index) => GlobalKey<_DraggableShapeState>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Stack(
        children: List.generate(4, (index) => _buildDraggableShape(index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Back to Main',
        child: Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildDraggableShape(int index) {
    return DraggableShape(
      key: keys[index],
      shape: index,
      child: Container(
        width: index == 2 ? 50 : 100,
        height: index == 3 ? 30 : 100,
        decoration: BoxDecoration(
          color: index == 0 ? Colors.blue : index == 1 ? Colors.red : index == 2 ? Colors.green : Colors.purple,
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}

class DraggableShape extends StatefulWidget {
  final Widget child;
  final int shape;

  DraggableShape({Key? key, required this.child, required this.shape}) : super(key: key);

  @override
  _DraggableShapeState createState() => _DraggableShapeState();
}

class _DraggableShapeState extends State<DraggableShape> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final SpringSimulation _simulation;
  double _top = 350.0;
  double _left = 150.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
      ..addListener(_updatePosition);
    _simulation = SpringSimulation(
      SpringDescription.withDampingRatio(
        mass: 1.0,
        stiffness: 100.0,
        ratio: 1.0,
      ),
      0.0,
      1.0,
      0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      left: _left,
      child: Draggable(
        child: widget.child,
        feedback: widget.child,
        childWhenDragging: Container(),
        onDragEnd: (details) {
          _controller.animateWith(_simulation);
        },
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            _top = offset.dy;
            _left = offset.dx;
          });
        },
      ),
    );
  }

  void _updatePosition() {
    setState(() {
      _top += _simulation.dx(_controller.value);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}