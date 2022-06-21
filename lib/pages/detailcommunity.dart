import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/community.dart';
import 'package:sell_car_app/pages/modifycommunity.dart';
import 'package:sell_car_app/static.dart';
import 'package:http/http.dart' as http;

class Detailcommunity extends StatefulWidget {
  final int pnum;
  final String title;
  final String content;
  final String createAt;
  final String nickname;
  const Detailcommunity({
    Key? key,
    required this.pnum,
    required this.title,
    required this.content,
    required this.createAt,
    required this.nickname,
  }) : super(key: key);

  @override
  State<Detailcommunity> createState() => _DetailcommunityState();
}

class _DetailcommunityState extends State<Detailcommunity> {
  late TextEditingController commentController;
  late TextEditingController subcontroller;
  late String result;

  late List commentList;
  late int cnum;

  @override
  void initState() {
    commentList = [];
    _commentLists();
    commentController = TextEditingController();
    subcontroller = TextEditingController();
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.5, color: Color.fromARGB(255, 4, 31, 56)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("  Writer : ${Static.nickname}"),
                                const SizedBox(
                                  width: 100,
                                ),
                                Text(
                                    'DATE : ${Static.createDate.toString().substring(0, 11)}\n'
                                    '                      ${Static.createDate.toString().substring(11, 19)}',
                                    textAlign: TextAlign.right),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${Static.content}',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Modifycommunity(
                                pnum: widget.pnum,
                                nickname: widget.nickname,
                                title: widget.title,
                                content: widget.content,
                              ),
                            ));
                      }),
                      child: const Text("MODIFY")),
                  TextButton(
                      onPressed: (() {
                        _showDialog(context);
                      }),
                      child: const Text(
                        "DELETE",
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _commentBox(),
              _builTextComposer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _builTextComposer() {
    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: commentController,
            keyboardType: TextInputType.text,
            onSubmitted: _handleSumitted,
            decoration: InputDecoration(
              labelText: "Input comment",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        Container(
          child: IconButton(
            onPressed: () {
              _handleSumitted(commentController.text);
              setState(() {
                Static.comment = commentController.text;
                _addcomment();
              });
            },
            icon: const Icon(
              Icons.send,
              color: Color.fromARGB(255, 4, 31, 56),
            ),
          ),
        )
      ],
    );
  }

  void _handleSumitted(String text) {
    commentController.clear();
  }

  Widget _commentBox() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: commentList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // _commentLists();
                Static.cnickname = commentList[index]['nickname'];
                Static.cnum = commentList[index]['cnum'];
                
              },
              child: Card(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: ListTile(
                        title: Text('${commentList[index]['nickname']}'
                            .toString()
                            .substring(0)),
                        subtitle: Text('${commentList[index]['comment']}'
                            .toString()
                            .substring(0)),
                        trailing: TextButton(
                          onPressed: (() {
                            Static.comment = commentController.text;
                          }),
                          child: const Text("REPLY"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }


  _commentLists() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/sell_car/commentmain.jsp?user=${Static.id}&pnum=${widget.pnum}');
    var response = await http.get(url);

    setState(() {
        var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
        List result = dataConvertedJSON['results'];
        commentList.addAll(result);
    });
  }

  deleteAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/sell_car/deleteboard.jsp?pnum=${widget.pnum}');
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
  }

  _addcomment() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/sell_car/addcomment.jsp?posing_num=${widget.pnum}&comment_user=${Static.id}&comment=${commentController.text}');
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ARE YOU SURE YOU WANT TO DELETE THIS POST? '),
            content:
                const Text('IF YOU DELETE THE POST, YOU CAN' 'T GET IT BACK. '),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      deleteAction();
                      Navigator.of(context).pop();
                      Navigator.pop(context);
                    },
                    child: const Text('YES'),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:
                        const Text('NO', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
