import 'package:flutter/material.dart';

class PreviewCard extends StatelessWidget {
  final EdgeInsets? margin;

  final EdgeInsets? padding;

  final BorderRadius? borderRadius;

  final List<BoxShadow>? boxShadow;

  final List<Widget> children;

  final void Function()? onTap;

  const PreviewCard(
      {super.key,
      this.margin,
      this.padding,
      this.borderRadius,
      required this.children,
      this.onTap,
      this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(8),
        margin: margin,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius ?? BorderRadius.circular(6),
            boxShadow: boxShadow),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
