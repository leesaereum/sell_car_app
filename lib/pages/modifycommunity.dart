import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sell_car_app/static.dart';
import 'package:http/http.dart' as http;

class Modifycommunity extends StatefulWidget {
  final int pnum;
  final String title;
  final String content;
  final String nickname;
  const Modifycommunity({
    Key? key,
    required this.pnum,
    required this.title,
    required this.content,
    required this.nickname,
  }) : super(key: key);

  @override
  State<Modifycommunity> createState() => _ModifycommunityState();
}

class _ModifycommunityState extends State<Modifycommunity> {
  late TextEditingController nickController;
  late TextEditingController titleController;
  late TextEditingController contentController;
  late String result;
  late String result1;

  @override
  void initState() {
    nickController = TextEditingController(text: '${Static.nickname}');
    titleController = TextEditingController(text: '${Static.title}');
    contentController = TextEditingController(text: '${Static.content}');
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "NICKNAME :${Static.nickname}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
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
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2, color: Color.fromARGB(255, 4, 31, 56)),
                        borderRadius: BorderRadius.circular(15),
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
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2, color: Color.fromARGB(255, 4, 31, 56)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: (() {
                        Static.title = titleController.text;
                        Static.content = contentController.text;
                        updateAction();
                        historyAction();
                        hisChangeAction();
                      }),
                      child: const Text('COMPLETE')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Functions
  updateAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/sell_car/modifyboard.jsp?title=${Static.title}&content=${Static.content}&pNum=${widget.pnum}');
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

  historyAction() async {
    var url1 = Uri.parse(
        'http://localhost:8080/Flutter/sell_car/updateboard.jsp?pnum=${widget.pnum}');
    var response1 = await http.get(url1);
    setState(() {
      var dataConvertedJSON1 = json.decode(utf8.decode(response1.bodyBytes));

      result1 = dataConvertedJSON1["result"];

      if (result1 == "OK") {
        _showDialog(context);
      } else {
        _errorSnackBar(context);
      }
    });
  }

  hisChangeAction() async {
    var url1 = Uri.parse(
        'http://localhost:8080/Flutter/sell_car/hischange.jsp?pnum=${widget.pnum}');
    var response1 = await http.get(url1);
    setState(() {
      var dataConvertedJSON1 = json.decode(utf8.decode(response1.bodyBytes));

      result1 = dataConvertedJSON1["result"];

      if (result1 == "OK") {
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
            title: const Text("Complete"),
            content: const Text('Complet modifying'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('To Community')),
            ],
          );
        });
  }

  _errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Can not road updated datas'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
