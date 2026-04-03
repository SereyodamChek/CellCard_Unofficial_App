import 'package:cellcard_app/Entertainment_Lifestyle_Services/CustomCard-5.dart';
import 'package:flutter/material.dart';

class voice_mail extends StatelessWidget {
  const voice_mail({super.key});

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
                  'images/z38.jpg',
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
                  'Receive voice message when you\'re busy or your phone runs out of battery!',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            const CustomCard_5(
                avatarImagePath: 'images/z35.png',
                title: 'Currency Exchange & GoldRate',
                price: '\$0.05',
                validity: '1 Days',
                text:
                    'Receive voice message when you\'re busy or your phone runs out of battery!',
                autoRenewText: 'Auto-renew every days',
                autoRenewImagePath: 'images/s8.png'),
            const CustomCard_5(
                avatarImagePath: 'images/z35.png',
                title: 'Currency Exchange & GoldRate',
                price: '\$0.50',
                validity: '30 Days',
                text:
                    'Receive voice message when you\'re busy or your phone runs out of battery!',
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
