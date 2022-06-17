import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sell_car_app/pages/mylist_detail.dart';
import 'package:sell_car_app/static.dart';

class Mylist extends StatefulWidget {
  const Mylist({Key? key}) : super(key: key);

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  late List mylist;

  @override
  void initState() {
    super.initState();
    mylist = [];
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('images/sellcar.png', width: 180),
          backgroundColor: Color.fromARGB(255, 4, 31, 56),
        ),
        body: Center(
            child: mylist.isEmpty
                ? Column(
                    children: const [
                      SizedBox(height: 250),
                      Text(
                        'YOUR LIST IS EMPTY'
                        '\n ADD YOUR LIST',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: mylist.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mylist_Detail(
                                list_num: mylist[index]['list_num'],
                              ),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          mylist[index]['list_title'],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 15),
                                    child: Row(
                                      children: [
                                        const Text('DATE :',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(mylist[index]['list_createAt'],
                                            style: const TextStyle(
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )));
  }

  getData() async {
    var url = Uri.parse(
        "http://localhost:8080/Flutter/sell_car/readmylist.jsp?user_id=${Static.id}");
    var response = await http.get(url);
    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      if (JSON['result'] != null) {
        List result = JSON['result'];
        mylist.addAll(result);
      } else {
        mylist = [];
      }
    });
  }

  rebuild() {
    setState(() {
      mylist = [];
      getData();
    });
  }
}
