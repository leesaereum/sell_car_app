import 'package:flutter/material.dart';
import 'package:sell_car_app/static.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class CheckBrand extends StatefulWidget {
  const CheckBrand({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<CheckBrand> createState() => _CheckBrandState();
}

class _CheckBrandState extends State<CheckBrand> {
  final List<String> titles = [
    "",
    "",
    "",
    "",
    "",
  ];

  final List<String> brands = ["Audi", "Benz", "Vw", "Ford", "Bmw"];

  @override
  void initState() {
    super.initState();
    Static.brand = '';
    Static.model = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'CHOOSE BRAND',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                width: 400,
                child: VerticalCardPager(
                  initialPage: 2,
                  titles: titles,
                  images: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Static.brand != "Audi"
                                  ? Colors.grey
                                  : Colors.amber,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          "images/audiLogo.png",
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Static.brand != "Benz"
                                    ? Colors.grey
                                    : Colors.amber,
                                width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "images/benzLogo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Static.brand != "Vw"
                                    ? Colors.grey
                                    : Colors.amber,
                                width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "images/volkswagenLogo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Static.brand != "Ford"
                                    ? Colors.grey
                                    : Colors.amber,
                                width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          "images/fordLogo.png",
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Static.brand != "Bmw"
                                    ? Colors.grey
                                    : Colors.amber,
                                width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "images/bmwLogo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                  onPageChanged: (page) {},
                  onSelectedItem: (index) {
                    setState(() {
                      Static.brand = brands[index];
                    });
                  },
                ),
              ),
            ),
            //const SizedBox(height: 30),
            PrimaryButton(
              onPressed: Static.brand != '' ? widget.onNext : nobrand(),
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

nobrand() {}
