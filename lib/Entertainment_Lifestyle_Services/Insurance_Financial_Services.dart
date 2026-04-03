import 'package:flutter/material.dart';

class Insurance_Financial_Services extends StatelessWidget {
  const Insurance_Financial_Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        centerTitle: true,
        title: const Text(
          'Insurance & Financial Services',
          style: TextStyle(color: Colors.white, fontSize: 16),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/z22.png',
              width: 65,
              height: 65,
              filterQuality: FilterQuality.medium,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Coming soon',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('We\'re prepaing something exciting. stay '),
            const Text('tuned!'),
          ],
        ),
      ),
    );
  }
}
