import 'package:cellcard_app/Telecom_Plan_Services/Cellcard_Serey.dart';
import 'package:cellcard_app/Entertainment_Lifestyle_Services/Entertainment_Lifestyle_Services.dart';
import 'package:cellcard_app/Telecom_Plan_Services/International.dart';
import 'package:cellcard_app/Telecom_Plan_Services/Social_Pack.dart';
import 'package:cellcard_app/Telecom_Plan_Services/data+.dart';
import 'package:flutter/material.dart';

class Telecom_Plan_Services extends StatelessWidget {
  const Telecom_Plan_Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 245, 158, 26),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                        )),
                  ),
                  Image.asset(
                    'images/z19.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      top: 10,
                      right: 325,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new)))
                ],
              ),
            ),
            Material(
              child: Container(
                height: 45,
                color: const Color.fromARGB(255, 245, 158, 26),
                child: TabBar(
                  physics: const ClampingScrollPhysics(),
                  // padding: EdgeInsets.all(10),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  // indicatorColor: Colors.white,
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text('Plans'),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text('Add-ons'),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text('International'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Plans'),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CellcardSerey(),
                                ),
                              );
                            },
                            child: reuseCard(
                                'images/p7.png',
                                'Cellcard Serey+',
                                'From \$1.50',
                                'the product with big data that allows you to discover and enjoy your kind of fun with full freedom of data usage.',
                                isChecked: true),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
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
                                  builder: (context) =>
                                      const Entertainment_Lifestyle_Services(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.blue,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: Colors.blue,
                                    width: 1), // Add this line
                              ),
                            ),
                            child: const Text(
                              'Enterainment & Lifestyle services',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Add-ons'),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DataTopUpPage(),
                                ),
                              );
                            },
                            child: reuseCard(
                                'images/z21.png',
                                'DATA+',
                                'From \$0.25',
                                'Add data on top of any plan whenever you need to. also great for your tablets and routers',
                                isChecked: true),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SocialPackPage(),
                                ),
                              );
                            },
                            child: reuseCard(
                                'images/z20.png',
                                'Social Pack',
                                'From \$0.05',
                                'Upsize your Social Life with Social Pack Add-ons! eNJOY A dedicated data pack for your all of your...',
                                isChecked: true),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
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
                                  builder: (context) =>
                                      const Entertainment_Lifestyle_Services(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.blue,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: Colors.blue,
                                    width: 1), // Add this line
                              ),
                            ),
                            child: const Text(
                              'Enterainment & Lifestyle services',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('International'),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const InternationalPacksPage(),
                                ),
                              );
                            },
                            child: reuseCard(
                                'images/s3.png',
                                'Roaming Internet',
                                'From \$2.00',
                                'Worry-free roaming internet bundles, starting from \$2',
                                isChecked: true),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
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
                                  builder: (context) =>
                                      const Entertainment_Lifestyle_Services(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.blue,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: Colors.blue,
                                    width: 1), // Add this line
                              ),
                            ),
                            child: const Text(
                              'Enterainment & Lifestyle services',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect reuseCard(
      String imagePath, String title, String subtitle, String description,
      {bool isChecked = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
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
                      imagePath,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
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
                  if (isChecked)
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                      size: 16,
                    )
                ],
              ),
            ),
            const Divider(
              indent: 18,
              endIndent: 18,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Text(
                  description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
