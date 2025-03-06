import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CustomButton({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: isSelected
                  ? [
                      Colors.white,
                      Colors.black.withValues(alpha: .9),
                    ]
                  : [
                      Color(0XFFA90808),
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
          child: Container(
            height: 38,
            width: 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0XFFA90808),
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
