import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:supercharged/supercharged.dart';

class SquishSwitch extends StatefulWidget {
  const SquishSwitch({
    Key? key,
    this.firstChild = Icons.close,
    this.secondChild = Icons.filter_list,
    this.switched = false,
    this.iconSize = 30,
    this.firstIconColor = Colors.red,
    this.secondIconColor = Colors.grey,
    this.transform,
  }) : super(key: key);

  final IconData firstChild;
  final IconData secondChild;
  final bool switched;
  final double iconSize;
  final Color firstIconColor;
  final Color secondIconColor;
  final Matrix4? transform;

  @override
  _SquishSwitchState createState() => _SquishSwitchState();
}

class _SquishSwitchState extends State<SquishSwitch> with AnimationMixin {
  final Duration duration = 300.milliseconds;

  void toggleAnimation() {
    if (controller.isAnimating) return;
    if (controller.isCompleted) {
      controller.playReverse(duration: duration);
    } else {
      controller.play(duration: duration);
    }
  }

  @override
  void didUpdateWidget(covariant SquishSwitch oldWidget) {
    if (oldWidget.switched != widget.switched) {
      toggleAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double scaleFactor = 2 * (controller.value - 0.5).abs();
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scale(1.0, scaleFactor),
      child: Icon(
        controller.value > 0.5 ? widget.firstChild : widget.secondChild,
        color: controller.value > 0.5 ? widget.firstIconColor : widget.secondIconColor,
        size: widget.iconSize,
      ).transform(transform: widget.transform ?? Matrix4.identity(), alignment: Alignment.center),
    );
  }
}
