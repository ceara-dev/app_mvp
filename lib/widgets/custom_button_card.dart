import 'package:flutter/material.dart';

class CustomButtonCard extends StatelessWidget {
  final Color color;
  final Color splashColor;
  final Color highlightColor;
  final double borderRadius;
  final VoidCallback onTap;
  final Widget child;

  const CustomButtonCard({
    super.key,
    required this.color,
    required this.splashColor,
    required this.highlightColor,
    required this.borderRadius,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: splashColor,
        highlightColor: highlightColor,
        onTap: onTap,
        child: SizedBox(
          width: 20.0,  
          height: 20.0,  
          child: Card(
            color: color,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
