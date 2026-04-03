import 'package:cellcard_app/Entertainment_Lifestyle_Services/exchanges_glod.dart';
import 'package:cellcard_app/Entertainment_Lifestyle_Services/miss_call.dart';
import 'package:cellcard_app/Entertainment_Lifestyle_Services/voice_mail.dart';
import 'package:flutter/material.dart';

class VAS extends StatelessWidget {
  const VAS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.orange[400],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'VAS',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const miss_call(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  // height: 100,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.orange,
                              child: Image.asset('images/z33.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Missed Call Alerts',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'From \$0.30',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.pink[800],
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blue,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 5),
                          child: Divider(),
                        ),
                        const Text(
                          'Worry-free about missed calls, even if your phone runs out of battery or out of coverage.',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const exchanges_glod(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  // height: 100,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.orange,
                              child: Image.asset('images/z34.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Currency Exchange & Gold Rate',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'From \$0.10',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.pink[800],
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blue,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 5),
                          child: Divider(),
                        ),
                        const Text(
                          'Stay updated with most used currency exchange & gold rates daily for your business!',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const voice_mail(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  // height: 100,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.orange,
                              child: Image.asset('images/z35.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Voice Mail Service',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'From \$0.05',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.pink[800],
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blue,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 5),
                          child: Divider(),
                        ),
                        const Text(
                          'Receive voice message when you\'re busy or your phone runs out of battery!',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
