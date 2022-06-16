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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Addcommunity(),
                    ));
              }),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
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
                            const SizedBox(
                              width: 10,
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
                                          "My car's price was predicted to be 15000 pound on SELL CAR. "
                                          "If you are intered in my car, Please contact the below number.  "
                                          "My number is 05-345-1244",
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

        Static.action = false;
      }
    });
  }
}
