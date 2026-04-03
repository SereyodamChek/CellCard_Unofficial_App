import 'package:cellcard_app/Entertainment_Lifestyle_Services/CustomCard-5.dart';

import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

class miss_call extends StatelessWidget {
  const miss_call({super.key});

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
                  'images/z36.jpg',
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.fill,
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
                  'Worry-free about missed calls, even if your phone runs out of battery or out of coverage.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            const CustomCard_5(
                avatarImagePath: 'images/z33.png',
                title: 'Missed Call Alert',
                price: '\$0.30',
                validity: '30 Days',
                text:
                    'Worry-free about missed calls, even if your phone runs out of battery or out of coverage.',
                autoRenewText: 'Auto-renew every 30 days',
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
