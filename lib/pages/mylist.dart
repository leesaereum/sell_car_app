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
  int widths = 0;

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
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 0, 0),
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
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        const Text('DATE :',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(mylist[index]['list_createAt'],
                                            style: const TextStyle(
                                                color: Colors.grey)),
                                        SizedBox(width: 130),
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'DELETE LIST'),
                                                      content: const Text(
                                                          'DO YOU WANT TO DELETE LIST?'),
                                                      actions: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {
                                                                delete(mylist[
                                                                        index][
                                                                    'list_num']);
                                                              },
                                                              child: const Text(
                                                                'YES',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            4,
                                                                            31,
                                                                            56)),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 40),
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                'NO',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            4,
                                                                            31,
                                                                            56)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: const Icon(
                                              Icons.highlight_remove,
                                              color: Colors.grey,
                                            ))
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

  void delete(String num) async {
    var url = Uri.parse(
        "http://localhost:8080/Flutter/sell_car/listdelete.jsp?list_num=$num");
    var response = await http.get(url);
    String result = "";

    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      result = JSON['result'];
    });

    if (result == "OK") {
      Navigator.pop(context);
      rebuild();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('COMPLETE TO DELETE LSIT'),
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("SORRY, CAN'T DELETE YOUR LIST :(\nTRY ONE TIME"),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ));
    }
  }
}
