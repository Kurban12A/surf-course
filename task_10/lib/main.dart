import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  Color _currentColor = MyColors.firstColor;
  double _top = 150;
  double _left = 150;

  /// проверяем текущий цвет объекта и переключаемся на следующий
  void _changeColor () {
    if (_currentColor == MyColors.firstColor) {
      _currentColor = MyColors.secondColor;
    } else if (_currentColor == MyColors.secondColor) {
      _currentColor = MyColors.thirdColor;
    } else {
      _currentColor = MyColors.firstColor;
    }
  }
  /// перемещение объекта
  void _updateDetails(details) {
    _top = max(0, _top + details.delta.dy);
    _left = max(0, _left + details.delta.dx);
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    setState(() {
      _controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      );
      _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      );
    });
  }

  void _onTap() {
    setState(() {
      _changeColor();
    });
  }

  void _onPanUpdate(details) {
    setState(() {
      _updateDetails(details);
    });
  }

  void _onLongPress() {
    setState(() {
      _controller.repeat();
    });
  }

  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onLongPress: _onLongPress,
              onLongPressEnd:(details) => _controller.stop(),
              onPanUpdate: _onPanUpdate,
              onTap: _onTap,
              child: RotationTransition(
                turns: _animation,
                child: Container(
                  color: _currentColor,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    
    }
    
}


abstract class MyColors {
  static const firstColor = Colors.green;
  static const secondColor = Colors.red;
  static const thirdColor = Colors.blue; 
}