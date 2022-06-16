import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_car_app/pages/community.dart';
import 'package:sell_car_app/pages/communityList.dart';
import 'package:sell_car_app/static.dart';

class Addcommunity extends StatefulWidget {
  const Addcommunity({Key? key}) : super(key: key);

  @override
  State<Addcommunity> createState() => _AddcommunityState();
}

class _AddcommunityState extends State<Addcommunity> {
  late TextEditingController nickController;
  late TextEditingController contentController;

  @override
  void initState() {
    nickController = TextEditingController(text: '${Static.nickname}');
    contentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELL CAR'),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: nickController,
                readOnly: true,
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                    labelText: 'Input content',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              TextButton(
                  onPressed: (() {
                      if (contentController.text.isEmpty) {
                        Static.content = contentController.text;
                        Static.action = true;
                      }
                    Navigator.pop(context);
                  }),
                  child: const Text("Upload")),
            ],
          ),
        ),
      ),
    );
  }
}
