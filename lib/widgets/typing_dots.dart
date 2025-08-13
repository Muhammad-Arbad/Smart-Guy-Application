
import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';



class ColorfulBouncingDots extends StatefulWidget {
  const ColorfulBouncingDots({super.key});

  @override
  State<ColorfulBouncingDots> createState() => _ColorfulBouncingDotsState();
}

class _ColorfulBouncingDotsState extends State<ColorfulBouncingDots>
    with TickerProviderStateMixin {
  final List<Color> _colors = [CustomAppColors.bodyColor,CustomAppColors.greyColor,CustomAppColors.primaryColor];
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _controllers = List.generate(_colors.length, (i) {
      return AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      );
    });

    _animations = _controllers.map((controller) {
      return Tween(begin: 0.0, end: -7.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();
  }

  void _startAnimations() {
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 150), () {
        if (_disposed) return; // Don't start if already disposed

        _controllers[i].repeat(reverse: true);
      });
    }
  }

  @override
  void dispose() {
    _disposed = true;
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      padding: const EdgeInsets.fromLTRB(18, 16, 14, 18),
      decoration: BoxDecoration(
        color: CustomAppColors.chatoptionbg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_colors.length, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animations[index].value),
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: _colors[index],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}