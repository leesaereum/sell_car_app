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
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset("./images/sellcar.png",width: 180,),
          backgroundColor: Color.fromARGB(255, 4, 31, 56),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('NICKNAME : ${Static.nickname}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                      labelText: 'Input content',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  maxLength: 50,
                ),
                TextButton(
                    onPressed: (() {
                        if (contentController.text.isEmpty) {
                          Static.content = contentController.text;
                          Static.action = true;
                          ComList(nick: nickController.text, 
                          content: contentController.text);
                        }
                      Navigator.pop(context);
                    }),
                    child: const Text("Upload")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
