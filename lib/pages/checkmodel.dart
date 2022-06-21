import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:sell_car_app/static.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

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
        carName.add('A4');
        carName.add('Q3');

        carImg.add("images/Audi_A3.png");
        carImg.add("images/Audi_A4.png");
        carImg.add("images/Audi_Q3.png");
        break;
      case 'Ford':
        carName.add('FIESTA');
        carName.add('FOCUS');
        carName.add('KUGA');
        carImg.add('images/ford_fiesta3.webp');
        carImg.add('images/ford_focus.png');
        carImg.add('images/ford_kuga.png');
        break;
      case 'Vw':
        carName.add('GOLF');
        carName.add('POLO');
        carName.add('TIGUAN');

        carImg.add('images/vw_golf.png');
        carImg.add('images/vw_polo.png');
        carImg.add('images/vw_tiguan.png');
        break;
      case 'Benz':
        carName.add('A CLASS');
        carName.add('C CLASS');
        carName.add('E CLASS');
        carImg.add('images/benz_Aclass.png');
        carImg.add('images/benz_Cclass.png');
        carImg.add('images/benz_Eclass.png');
        break;
      case 'Bmw':
        carName.add('1 SERIES');
        carName.add('2 SERIES');
        carName.add('3 SERIES');

        carImg.add('images/bmw_1series.png');
        carImg.add('images/bmw_2series.png');
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
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  align: ALIGN.CENTER,
                  initialPage: 1,
                  textStyle: const TextStyle(
                    //fontSize: 20,
                    fontFamily: "Bevan",
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                  titles: carName,
                  images: [
                    Hero(
                      tag: carName[0],
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Static.model == carName[0].toLowerCase()
                                    ? Colors.amber
                                    : Colors.grey,
                                width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(carImg[0]),
                        ),
                      ),
                    ),
                    Hero(
                      tag: carName[1],
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Static.model == carName[1].toLowerCase()
                                    ? Colors.amber
                                    : Colors.grey,
                                width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(carImg[1]),
                        ),
                      ),
                    ),
                    Hero(
                      tag: carName[2],
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Static.model == carName[2].toLowerCase()
                                    ? Colors.amber
                                    : Colors.grey,
                                width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(carImg[2]),
                        ),
                      ),
                    ),
                  ],
                  onPageChanged: (page) {},
                  onSelectedItem: (index) {
                    setState(() {
                      Static.model = carName[index].toLowerCase();
                    });
                  },
                ),
              ),
            ),
            //const SizedBox(height: 10),
            PrimaryButton(
              onPressed: Static.model != '' ? widget.onNext : nomodel(),
              text: 'NEXT',
            ),
            const SizedBox(height: 30),
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
