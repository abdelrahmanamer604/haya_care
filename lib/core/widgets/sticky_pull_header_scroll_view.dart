import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';

class StickyPullHeaderScrollView extends StatefulWidget {
  final Widget header;
  final List<Widget> children;
  final double headerHeight;
  final EdgeInsetsGeometry? padding;

  const StickyPullHeaderScrollView({
    super.key,
    required this.header,
    required this.children,
    this.headerHeight = 56,
    this.padding,
  });

  @override
  State<StickyPullHeaderScrollView> createState() =>
      _StickyPullHeaderScrollViewState();
}

class _StickyPullHeaderScrollViewState
    extends State<StickyPullHeaderScrollView> {
  final ValueNotifier<double> _scrollOffset = ValueNotifier<double>(0);

  @override
  void dispose() {
    _scrollOffset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPad = widget.headerHeight.h;
    final basePadding = widget.padding ??
        EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 112.h);

    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.depth == 0 &&
                notification is ScrollUpdateNotification) {
              _scrollOffset.value = notification.metrics.pixels;
            }
            return false;
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: basePadding.add(EdgeInsets.only(top: topPad)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            ),
          ),
        ),
        ValueListenableBuilder<double>(
          valueListenable: _scrollOffset,
          builder: (context, offset, child) {
            final dy = -math.max(0.0, offset);
            return Positioned(
              top: dy,
              left: 0,
              right: 0,
              child: child!,
            );
          },
          child: Container(
            color: context.theme.scaffoldBackgroundColor,
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 6.h),
            child: widget.header,
          ),
        ),
      ],
    );
  }
}
