import 'package:flutter/material.dart';
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
  late final _controller = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELL CAR'),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
        bottom: ReadOnlyTabBar(
          child: TabBar(
            controller: _controller,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.looks_one,
                  color: Colors.white,
                ),
                text: 'BRAND',
              ),
              Tab(
                icon: Icon(
                  Icons.looks_two,
                  color: Colors.white,
                ),
                text: 'MODEL',
              ),
              Tab(
                icon: Icon(
                  Icons.looks_3,
                  color: Colors.white,
                ),
                text: 'DETAILS',

              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          CheckBrand(
            onNext: () => _controller.index = 1,
          ),
          CheckModel(
            onNext: () => _controller.index = 2,
          ),
          CheckInfo(),
        ],
      ),
    );
  }
}

class ReadOnlyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar child;
  const ReadOnlyTabBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(child: child);
  }

  @override
  Size get preferredSize => child.preferredSize;
}

// class PrimaryButton extends StatelessWidget {
//   const PrimaryButton({Key? key, required this.text, this.onTap})
//       : super(key: key);
//   final String text;
//   final VoidCallback? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: onTap,
//         child: Card(child: Image.asset(text),)
//     );
//   }
// }