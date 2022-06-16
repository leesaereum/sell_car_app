import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/addcommunity.dart';
import 'package:sell_car_app/pages/communityList.dart';
import 'package:sell_car_app/pages/detailcommunity.dart';
import 'package:sell_car_app/static.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List<ComList> comList = [];

  @override
  void initState() {
    comList.add(ComList(nick: '${Static.nickname}', content: "test"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELL CAR'),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.pushNamed(
                  context, '/Addcommunity').then((value) => rebuildData()
                  );
              }),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: comList.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  Static.content = comList[position].content;
                  Static.nickname = comList[position].nick;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Detailcommunity(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.grey[350],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
                            child: Text(
                              "${Static.nickname}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                            child: SizedBox(
                              height: 40,
                              width: 250,
                              child: Flexible(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  text: TextSpan(
                                    text:
                                       comList[position].content,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: const Text("DATE"),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  // Functions
  rebuildData(){
    setState(() {
      if(Static.action){
        comList.add(
          ComList(nick: Static.nickname, content: Static.content)
        );
        Static.action = false;
      }
    });
  }
}
