import 'package:flutter/material.dart';
import 'package:sell_car_app/static.dart';

class CheckModel extends StatefulWidget {
  const CheckModel({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<CheckModel> createState() => _CheckModelState();
}

class _CheckModelState extends State<CheckModel> {
  List<String> carName = [];
  List<String> carImg = [];
  @override
  void initState() {
    switch (Static.brand) {
      case 'Audi':
        carName.add('A3');
        carImg.add('images/Audi_A3.png');
        carName.add('A4');
        carImg.add('images/Audi_A4.png');
        carName.add('Q3');
        carImg.add('images/Audi_Q3.png');
        break;
      case 'Ford':
        carName.add('FIESTA');
        carImg.add('images/ford_fiesta3.webp');
        carName.add('FOCUS');
        carImg.add('images/ford_focus.png');
        carName.add('KUGA');
        carImg.add('images/ford_kuga.png');
        break;
      case 'Vw':
        carName.add('GOLF');
        carImg.add('images/vw_golf.png');
        carName.add('POLO');
        carImg.add('images/vw_polo.png');
        carName.add('TIGUAN');
        carImg.add('images/vw_tiguan.png');
        break;
      case 'Benz':
        carName.add('A CLASS');
        carImg.add('images/benz_Aclass.png');
        carName.add('C CLASS');
        carImg.add('images/benz_Cclass.png');
        carName.add('E CLASS');
        carImg.add('images/benz_Eclass.png');
        break;
      case 'Bmw':
        carName.add('1 SERIES');
        carImg.add('images/bmw_1series.png');
        carName.add('2 SERIES');
        carImg.add('images/bmw_2series.png');
        carName.add('3 SERIES');
        carImg.add('images/bmw_3series.png');
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'CHOOSE MODEL',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              Static.brand.toUpperCase(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Static.model = carName[0].toLowerCase();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Static.model == carName[0].toLowerCase()
                          ? Colors.amber
                          : Color.fromARGB(255, 4, 31, 56),
                      width: 3,
                    )),
                width: 350,
                height: 150,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      carImg[0],
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      carName[0],
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  Static.model = carName[1].toLowerCase();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Static.model == carName[1].toLowerCase()
                          ? Colors.amber
                          : Color.fromARGB(255, 4, 31, 56),
                      width: 3,
                    )),
                width: 350,
                height: 150,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      carImg[1],
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      carName[1],
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  Static.model = carName[2].toLowerCase();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Static.model == carName[2].toLowerCase()
                          ? Colors.amber
                          : Color.fromARGB(255, 4, 31, 56),
                      width: 3,
                    )),
                width: 350,
                height: 150,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      carImg[2],
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      carName[2],
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            PrimaryButton(
              onPressed: Static.model != '' ? widget.onNext : nomodel(),
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

nomodel() {}
