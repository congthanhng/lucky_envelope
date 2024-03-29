import 'package:flutter/material.dart';

class XCircularLoading extends StatefulWidget {
  const XCircularLoading(
      {super.key, this.width = 120, this.height = 120, required this.child});

  ///Default is 120
  final double width;

  ///Default is 120
  final double height;

  final Widget child;

  @override
  State<XCircularLoading> createState() => _XCircularLoadingState();
}

class _XCircularLoadingState extends State<XCircularLoading>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  )..repeat();

  late final Animation<double> _animation =
      Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: RotationTransition(turns: _animation, child: widget.child),
      ),
    );
  }
}
