import 'package:flutter/material.dart';

class CustomRoindButton extends StatelessWidget {
  final String? title;
  final Image img;
  final bool? isSelect;
  final Color? color;
  const CustomRoindButton({
    super.key,
    this.title,
    required this.img,
    this.isSelect,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 58,
          width: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            // color: Colors.white,
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.black.withValues(alpha: .9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        Positioned(
          top: 1.5,
          left: 1.5,
          right: 1.5,
          bottom: .05,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color(0XFF0D0D0D),
            ),
            child: img,
          ),
        )
      ],
    );
  }
}
