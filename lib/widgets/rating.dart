import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.value,
    this.color = Colors.black87,
    this.onValueClicked,
  });

  final double value;
  final Color color;
  final Function(int)? onValueClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          InkWell(
            onTap: () {
              if (onValueClicked != null) {
                onValueClicked!(i);
              }
            },
            child: (value >= (i))
                ? Icon(Icons.star, color: color)
                : (value >= i - 0.5)
                ? Icon(Icons.star_half, color: color)
                : Icon(Icons.star_border, color: color),
          ),
      ],
    );
  }
}
