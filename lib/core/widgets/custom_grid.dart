import 'package:flutter/material.dart';

class CustomSliverGrid extends StatelessWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount, crossCount;
  final EdgeInsetsGeometry? padding;
  final double spacing, runSpacing;
  const CustomSliverGrid({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.crossCount,
    this.spacing = 0,
    this.padding,
    this.runSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding ?? EdgeInsets.zero,
      sliver: SliverList.separated(
        separatorBuilder: (context, index) => SizedBox(height: runSpacing),
        itemBuilder: (context, index) => Row(
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            crossCount,
            (i) => Expanded(
              child: (index * crossCount) + i >= itemCount
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: spacing / 2),
                      child: itemBuilder(context, (index * crossCount) + i),
                    ),
            ),
          ),
        ),
        itemCount: (itemCount / 2).ceilToDouble().toInt(),

        // delegate: SliverChildBuilderDelegate(
        //   (context, index) => Row(
        //     spacing: spacing,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: List.generate(
        //       crossCount,
        //       (i) => Expanded(
        //         child: (index * crossCount) + i >= itemCount
        //             ? const SizedBox.shrink()
        //             : Padding(
        //                 padding: EdgeInsets.symmetric(vertical: spacing / 2),
        //                 child: itemBuilder(context, (index * crossCount) + i),
        //               ),
        //       ),
        //     ),
        //   ),
        //   childCount: (itemCount / 2).ceilToDouble().toInt(),
        // ),
      ),
    );
  }
}

class CustomGrid extends StatelessWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount, crossCount;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final double? spacing, runSpacing;

  final ScrollPhysics? physics;
  const CustomGrid({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.crossCount,
    this.spacing,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.runSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding ?? EdgeInsets.zero,
      itemCount: (itemCount / 2).ceilToDouble().toInt(),
      itemBuilder: (context, index) => Row(
        spacing: spacing ?? 0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          crossCount,
          (i) => Expanded(
            child: (index * crossCount) + i >= itemCount
                ? const SizedBox.shrink()
                : itemBuilder(context, (index * crossCount) + i),
          ),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(height: runSpacing ?? 0),
    );
  }
}
