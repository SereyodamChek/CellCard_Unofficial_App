import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String avatarImagePath;
  final String title;
  final String price;
  final String data;
  final String calls;
  final String sms;
  final String validity;
  final String autoRenewText;
  final String bundleRolloverText;
  final String rolloverUnusedText;
  final String autoRenewImagePath;
  final String bundleRolloverImagePath;

  const CustomCard({
    super.key,
    required this.avatarImagePath,
    required this.title,
    required this.price,
    required this.data,
    required this.calls,
    required this.sms,
    required this.validity,
    required this.autoRenewText,
    required this.bundleRolloverText,
    required this.rolloverUnusedText,
    required this.autoRenewImagePath,
    required this.bundleRolloverImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      child: Image.asset(
                        avatarImagePath,
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      price,
                      style: TextStyle(color: Colors.pink[800]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Row(
                  children: [
                    const Text(
                      'Data',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      data,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'On-Net Calls',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      calls,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'SMS',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      sms,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Valid for',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      validity,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 8,
                      child: Image.asset(
                        autoRenewImagePath,
                        color: Colors.pink[800],
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      autoRenewText,
                      style: TextStyle(color: Colors.pink[800], fontSize: 13),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 8,
                      child: Image.asset(
                        bundleRolloverImagePath,
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      bundleRolloverText,
                      style: TextStyle(color: Colors.pink[800], fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  rolloverUnusedText,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.blue,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                              color: Colors.blue, width: 1), // Add this line
                        ),
                      ),
                      child: const Text(
                        'Send Gift',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Subscribe',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
