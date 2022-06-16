import 'package:flutter/material.dart';
import 'package:sell_car_app/static.dart';

class CheckModel extends StatefulWidget {
  const CheckModel({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<CheckModel> createState() => _CheckModelState();
}

class _CheckModelState extends State<CheckModel> {
  @override
  void initState() {
    print(Static.brand);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'CHOOSE MODEL',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              Static.brand,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Static.brand = 'Ford';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Static.brand == "Ford"
                      ? Colors.amber
                      : Color.fromARGB(255, 4, 31, 56),
                  width: 3,
                )),
                width: 350,
                height: 150,
                child: Image.asset('images/Audi_A3.png'),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  Static.brand = 'Ford';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Static.brand == "Ford"
                      ? Colors.amber
                      : Color.fromARGB(255, 4, 31, 56),
                  width: 3,
                )),
                width: 350,
                height: 150,
                child: Image.asset('images/Audi_A4.png'),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  Static.brand = 'Ford';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Static.brand == "Ford"
                      ? Colors.amber
                      : Color.fromARGB(255, 4, 31, 56),
                  width: 3,
                )),
                width: 350,
                height: 150,
                child: Image.asset('images/Audi_Q3.png'),
              ),
            ),
            const SizedBox(height: 10),
            PrimaryButton(
              onPressed: widget.onNext,
              text: 'NEXT',
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 100,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(primary: Color.fromARGB(255, 4, 31, 56)),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
