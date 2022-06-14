import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_car_app/pages/chechinfo.dart';
import 'package:sell_car_app/pages/checkbrand.dart';
import 'package:sell_car_app/pages/checkmodel.dart';

class CheckHome extends StatefulWidget {
  const CheckHome({Key? key}) : super(key: key);

  @override
  State<CheckHome> createState() => _CheckHomeState();
}

class _CheckHomeState extends State<CheckHome>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: controller,
          children: const [CheckBrand(), CheckModel(), CheckInfo()]),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blueGrey,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.blueGrey,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_3,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
