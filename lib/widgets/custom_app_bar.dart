import 'package:custom_appbar_expirement/utils/custom_wave_clipper.dart';
import 'package:custom_appbar_expirement/widgets/some_widget.dart';
import 'package:flutter/material.dart';

/// Кастомный аппбар на сливерах
class CustomAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    final topOffset =
        (minExtent - (shrinkOffset > minExtent ? minExtent : shrinkOffset)) *
            0.7;
    final topPadding = MediaQuery.of(context).padding.top + 16;

    return Stack(
      children: [
        ClipPath(
          clipper: CustomWaveClipper(),
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.indigoAccent,
                Colors.teal,
              ]),
            ),
          ),
        ),
        Positioned(
          top: topPadding,
          left: 16,
          child: AnimatedOpacity(
            opacity: shrinkOffset > 20 ? 0 : 1,
            duration: const Duration(milliseconds: 250),
            child: Text(
              'Title',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        Positioned(
          top: topOffset + topPadding,
          left: 16,
          right: 16,
          child: const SomeWidget(),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.minExtent != minExtent || oldDelegate.maxExtent != maxExtent;
}
