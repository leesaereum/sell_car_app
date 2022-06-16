import 'package:flutter/material.dart';
import 'package:sell_car_app/static.dart';

class CheckBrand extends StatefulWidget {
  const CheckBrand({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<CheckBrand> createState() => _CheckBrandState();
}

class _CheckBrandState extends State<CheckBrand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'CHOOSE BRAND',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                setState(() {
                Static.brand = 'Audi';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Static.brand == "Audi"?Colors.amber:Color.fromARGB(255, 4, 31, 56),
                    width: 3,
                    )
                ),
                width: 350,
                height: 80,
                child: 
                  Image.asset('images/audiLogo.png'),
              ),
            ),const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                Static.brand = 'Ford';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Static.brand == "Ford"?Colors.amber:Color.fromARGB(255, 4, 31, 56),
                    width: 3,
                    )
                ),
                width: 350,
                height: 80,
                child: 
                  Image.asset('images/fordLogo.png'),
              ),
            ),const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                Static.brand = 'Vw';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Static.brand == "Vw"?Colors.amber:Color.fromARGB(255, 4, 31, 56),
                    width: 3,
                    )
                ),
                width: 350,
                height: 80,
                child: 
                  Image.asset('images/volkswagenLogo.png'),
              ),
            ),const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                Static.brand = 'Benz';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Static.brand == "Benz"?Colors.amber:Color.fromARGB(255, 4, 31, 56),
                    width: 3,
                    )
                ),
                width: 350,
                height: 80,
                child: 
                  Image.asset('images/benzLogo.png'),
              ),
            ),const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                Static.brand = 'Bmw';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Static.brand == "Bmw"?Colors.amber:Color.fromARGB(255, 4, 31, 56),
                    width: 3,
                    )
                ),
                width: 350,
                height: 80,
                child: 
                  Image.asset('images/bmwLogo.png'),
              ),
            ),
            const SizedBox(height:30),
            PrimaryButton(
              onPressed : widget.onNext,
              text:'NEXT',),
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
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 4, 31, 56)
        ),
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