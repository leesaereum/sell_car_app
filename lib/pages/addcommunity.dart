import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sell_car_app/static.dart';
import 'package:http/http.dart' as http;

class Addcommunity extends StatefulWidget {
  const Addcommunity({Key? key}) : super(key: key);

  @override
  State<Addcommunity> createState() => _AddcommunityState();
}

class _AddcommunityState extends State<Addcommunity> {
  late TextEditingController nickController;
  late TextEditingController contentController;
  late TextEditingController titleController;

  late String title;
  late String content;
  late String nickname;
  late String result;

  @override
  void initState() {
    nickController = TextEditingController(text: '${Static.nickname}');
    contentController = TextEditingController();
    titleController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "./images/sellcar.png",
            width: 180,
          ),
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
                    Text(
                      'NICKNAME : ${Static.nickname}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Input title',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 3),
                          ),
                          ),
                  keyboardType: TextInputType.text,
                  maxLength: 10,
                ),
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
                      title = titleController.text;
                      content = contentController.text;
                      addAction();
                    }),
                    child: const Text("Upload")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/sell_car/addboard.jsp?user=${Static.id}&title=$title&content=$content');
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON["result"];

      if (result == "OK") {
        _showDialog(context);
      } else {
        _errorSnackBar(context);
      }
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('RESULT'),
            content: const Text('COMPLETE ADDING NEW DATAS'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  _errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('HAVE A PROBLEM ON ADDING NEW DATAS'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
