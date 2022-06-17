import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_car_app/pages/modifycommunity.dart';
import 'package:sell_car_app/static.dart';
// import 'package:comment_box/comment/comment.dart';

class Detailcommunity extends StatefulWidget {
  const Detailcommunity({Key? key}) : super(key: key);

  @override
  State<Detailcommunity> createState() => _DetailcommunityState();
}

class _DetailcommunityState extends State<Detailcommunity> {
  late TextEditingController commentController;

  @override
  void initState() {
    commentController = TextEditingController();
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
                height: 200,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5,color: Color.fromARGB(255, 4, 31, 56)),
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
                                  width: 130,
                                ),
                                Text(
                                    'DATE : ${Static.createDate.toString().substring(0, 13)}\n'
                                   
                                    '                      ${Static.createDate.toString().substring(11, 19)}',
                                    textAlign: TextAlign.right
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${Static.content}',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Modifycommunity(),));
                    }), 
                    child: const Text("MODIFY")
                    ),
                  TextButton(
                    onPressed: (() {
                     _showDialog(context);
                    }), 
                    child: const Text("DELETE",style: TextStyle(color: Colors.red),)
                    ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _builTextComposer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _builTextComposer() {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: commentController,
              keyboardType: TextInputType.text,
              onSubmitted: _handleSumitted,
              decoration: InputDecoration(labelText: "Input comment",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
              ),
            ),
          Container(
            child: IconButton(
              onPressed: () => _handleSumitted(commentController.text),
              icon: const Icon(
                Icons.send,
                color: Color.fromARGB(255, 4, 31, 56),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _handleSumitted(String text) {
    commentController.clear();
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ARE YOU SURE YOU WANT TO DELETE THIS POST? '),
            content: const Text('IF YOU DELETE THE POST, YOU CAN''T GET IT BACK. '),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      //
                    },
                    child: const Text('YES'),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  TextButton(
                    onPressed: () {
                     //
                    },
                    child: const Text('NO',style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
