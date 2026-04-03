import 'package:cellcard_app/Entertainment_Lifestyle_Services/vas.dart';
import 'package:cellcard_app/Telecom_Plan_Services/Telecom_Plan_Services.dart';
import 'package:flutter/material.dart';

class Entertainment_Lifestyle_Services extends StatelessWidget {
  const Entertainment_Lifestyle_Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        centerTitle: true,
        title: const Text(
          'Entertainment & Lifestyle Services',
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
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VAS(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  // height: 100,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Image.asset('images/s4.png'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text('VAS'),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        child: Text(
                          'Enhance your lifestyle experience with many service',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Text(
            'Couldn\'t find what you were looking for? See other services below',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Telecom_Plan_Services(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.blue,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                    color: Colors.blue, width: 1), // Add this line
              ),
            ),
            child: const Text(
              'Telecom Plan & Services',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.blue,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
