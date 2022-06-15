import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_car_app/main.dart';
import 'package:sell_car_app/pages/community.dart';

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
    );
  }
}
