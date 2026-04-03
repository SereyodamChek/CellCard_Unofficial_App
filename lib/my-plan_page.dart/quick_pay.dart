import 'package:flutter/material.dart';

class quick_pay extends StatelessWidget {
  const quick_pay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        centerTitle: true,
        title: const Text(
          'Quick Pay',
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
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'images/z15.png',
                  width: 55,
                  height: 55,
                  filterQuality: FilterQuality.medium,
                  color: Colors.grey[600],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('You don\'t have saved template yet'),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(11),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/a9.png',
                        width: 15,
                        height: 15,
                        filterQuality: FilterQuality.medium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          'Get things done faster by saving your frequent transaction to Quick Pay, here are 2 simple ways :',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      // height: 100,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'images/z17.png',
                              width: 25,
                              height: 25,
                              filterQuality: FilterQuality.medium,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('How to save Top-up template'),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.blue,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      // height: 100,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'images/z18.png',
                              width: 25,
                              height: 25,
                              filterQuality: FilterQuality.medium,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('How to save Product/Service remp...'),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.blue,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
