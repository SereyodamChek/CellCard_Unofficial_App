import 'package:flutter/material.dart';

class See_other_plans extends StatelessWidget {
  const See_other_plans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        centerTitle: true,
        title: const Text(
          'My plans',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your current plan',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                // height: 100,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: Image.asset(
                              'images/p7.png',
                              filterQuality: FilterQuality.medium,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cellcard Serey+',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'From \$1.50',
                                style: TextStyle(
                                    color: Color.fromARGB(
                                      255,
                                      193,
                                      33,
                                      99,
                                    ),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.check_rounded,
                            color: Colors.blue,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      indent: 18,
                      endIndent: 18,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: Text(
                          'the product with big data that allows you to discover and enjoy your kind of fun with full freedom of data usage.',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
