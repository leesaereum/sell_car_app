import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_car_app/main.dart';
import 'package:sell_car_app/pages/community.dart';
import 'package:sell_car_app/pages/mylist.dart';
import 'package:sell_car_app/pages/mypage.dart';
import 'package:sell_car_app/pages/tips.dart';
import 'package:sell_car_app/static.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  @override
  late TabController tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("./images/sellcar.png",width: 180,),
        backgroundColor: const Color.fromARGB(255, 4, 31, 56),
      ),
      body: TabBarView(
        controller: tabcontroller,
        children: const [Home(), Community()],
      ),
      bottomNavigationBar: TabBar(
        controller: tabcontroller,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.directions_car_filled,
              color: Color.fromARGB(255, 4, 31, 56),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.library_books,
              color: Color.fromARGB(255, 4, 31, 56),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Color.fromARGB(255, 2, 26, 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Hello [${Static.nickname}]!',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mypage(),
                      ));
                },
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 4, 31, 56),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: const Text('MYPAGE'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mylist(),
                      ));
                },
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 4, 31, 56),
                  child: Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                ),
                title: const Text('MYLIST'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tips(),
                      ));
                },
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 4, 31, 56),
                  child: Icon(
                    Icons.lightbulb,
                    color: Colors.white,
                  ),
                ),
                title: const Text('TIPS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
