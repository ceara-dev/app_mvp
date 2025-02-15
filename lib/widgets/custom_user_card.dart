import 'package:flutter/material.dart';

import '../utils/theme_color.dart';

class CustomUserCard extends StatefulWidget {
  const CustomUserCard({super.key});

  @override
  _CustomUserCardState createState() => _CustomUserCardState();
}

class _CustomUserCardState extends State<CustomUserCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 11,
      child: Card(
        color: ThemeColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24.0,
                    backgroundColor: ThemeColor.bgColor,
                    child: Icon(
                      Icons.person,
                      color: ThemeColor.primary,
                      size: 28.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('John Doe'),
                        Text('Custom User Card'),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
