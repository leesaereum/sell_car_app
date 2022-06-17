import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_car_app/static.dart';

class Modifycommunity extends StatefulWidget {
  const Modifycommunity({Key? key}) : super(key: key);

  @override
  State<Modifycommunity> createState() => _ModifycommunityState();
}

class _ModifycommunityState extends State<Modifycommunity> {

  late TextEditingController nickController;
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    nickController = TextEditingController(text: '${Static.nickname}');
    titleController = TextEditingController(text: '${Static.title}');
    contentController = TextEditingController(text: '${Static.content}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "./images/sellcar.png",
          width: 180,
        ),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: nickController,
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 3,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 3,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: contentController,
                  maxLength: 50,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 3,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: (() {
                    //
                  }), 
                  child: const Text('COMPLETE')
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}