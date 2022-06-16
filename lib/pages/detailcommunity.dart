import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_car_app/static.dart';

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
        title: const Text('SELL CAR'),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 300, 8),
              child: Text("Writer : ${Static.nickname}"),
            ),
            const Text(
                "My car's price was predicted to be 15000 pound on SELL CAR. "
                "If you are intered in my car, Please contact the below number.  "
                "My number is 05-345-1244"),
            Padding(
              padding: const EdgeInsets.fromLTRB(300, 0, 0, 8),
              child: const Text("DATE : "),
            ),
            _builTextComposer()
          ],
        ),
      ),
    );
  }
 Widget _builTextComposer(){
   return Container(
     child: Row(
       children: <Widget>[
         Flexible(
           child: TextField(
             controller: commentController,
             onSubmitted: _handleSumitted,
             decoration: InputDecoration(labelText: "Input comment"),
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

 void _handleSumitted(String text){
   commentController.clear();
 }
}
