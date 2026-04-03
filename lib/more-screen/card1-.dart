import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final String imagePath;
  final String text;

  const Card1({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 110,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.medium,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
