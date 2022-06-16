import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELL CAR'),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'MY LIST',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            mylist.isEmpty
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
                      return Card(
                          child: Column(
                        children: [
                          const Text('BRAND :'),
                          Text('${mylist[index]['brand']}'),
                        ],
                      ));
                    })
          ],
        ),
      ),
    );
  }
}
