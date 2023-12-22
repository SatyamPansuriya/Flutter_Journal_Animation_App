import 'package:flutter/material.dart';

class TransformWidget extends StatefulWidget {
  const TransformWidget({
    Key? key,
    this.distance = 100,
    this.timingMillisecond = 1000,
    this.totalWidget = 10,
    this.isChange = false,
    this.x = -250,
    this.y = -250,
    required this.widget,
  }) : super(key: key);
  final int distance;
  final int timingMillisecond;
  final int totalWidget;
  final double x;
  final double y;
  final bool isChange;
  final Widget widget;

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> with TickerProviderStateMixin {
  late List<AnimationController> animationControllers;
  late List<Animation<double>> animations;
  late List<Animation<double>> animationsTwo;

  @override
  void initState() {
    super.initState();
    animationControllers = List.generate(
      widget.totalWidget,
          (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (index * widget.distance) + widget.timingMillisecond),
      ),
    );

    animations = animationControllers.map((controller) {
      return Tween<double>(begin: widget.y, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    animationsTwo = animationControllers.map((controller) {
      return Tween<double>(begin: widget.x, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();
  }

  @override
  void dispose() {
    animationControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isChange) {
      animationControllers.forEach((controller) => controller.forward());
    } else {
      animationControllers.forEach((controller) => controller.reverse());
    }
    return Stack(
      children: List.generate(widget.totalWidget, (index) {
        return AnimatedBuilder(
          animation: animationControllers[index],
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(animationsTwo[index].value, animations[index].value),
              child: child,
            );
          },
          child: Opacity(
            opacity: index == 0 ? 1 : 1 / index,
            child: widget.widget,
          ),
        );
      }),
    );
  }
}