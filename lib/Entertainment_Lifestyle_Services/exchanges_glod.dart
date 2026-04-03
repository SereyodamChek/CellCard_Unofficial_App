import 'package:cellcard_app/Entertainment_Lifestyle_Services/CustomCard-5.dart';
import 'package:flutter/material.dart';

class exchanges_glod extends StatelessWidget {
  const exchanges_glod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/z37.png',
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.medium,
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              child: Container(
                child: const Text(
                  'Stay updated with most used currency exchange & gold rates daily for your business!.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            const CustomCard_5(
                avatarImagePath: 'images/z34.png',
                title: 'Currency Exchange & GoldRate',
                price: '\$0.30',
                validity: '30 Days',
                text:
                    'Stay updated with most used currency exchange & gold rates daily for your business!',
                autoRenewText: 'Auto-renew every days',
                autoRenewImagePath: 'images/s8.png'),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
