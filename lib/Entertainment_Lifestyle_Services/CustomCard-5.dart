import 'package:flutter/material.dart';

class CustomCard_5 extends StatelessWidget {
  final String avatarImagePath;
  final String title;
  final String price;
  final String validity;
  final String text;
  final String autoRenewText;
  final String autoRenewImagePath;

  const CustomCard_5({
    super.key,
    required this.avatarImagePath,
    required this.title,
    required this.price,
    required this.validity,
    required this.text,
    required this.autoRenewText,
    required this.autoRenewImagePath,
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
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  ],
                ),
                const Divider(),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 12),
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
                const SizedBox(
                  height: 15,
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
                        'Details',
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
