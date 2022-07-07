import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/web.dart';

class Tips extends StatefulWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  State<Tips> createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELL CAR'),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'USED CAR CHECKLIST',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '1. Engine. Check for leaks, oil level, head gasket condition and exhaust smoke.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  '2. Gearbox and clutch. Feel and listen to the smoothness of the gear change, and test the clutch biting point.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  '3. Bodywork. Check the outside and underneath – a torch is useful for the latter.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  '4. Wheels and tyres. Tread depth, rubber condition and makes of each tyre.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  '5. Interior. Check the boot, dash (for mileage and warning lights) and electronics thoroughly.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  '6. Test drive. Don’t hold back here, drive it until you have checked everything you want to.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  '7. Documents. V5c, service history and MoT (although this is now available online).',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'RECOMMENDED SITE',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(110, 50),
                            primary: const Color.fromARGB(255, 4, 31, 56)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebPage(
                                        siteName:
                                            'www.autotrader.co.uk/cars/used',
                                      )));
                        },
                        child: const Text('AutoTrader')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 50),
                            primary: const Color.fromARGB(255, 4, 31, 56)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebPage(
                                        siteName:
                                            'www.ebay.co.uk/b/Cars/9801/bn_1839037',
                                      )));
                        },
                        child: const Text('ebay')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 50),
                            primary: const Color.fromARGB(255, 4, 31, 56)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebPage(
                                        siteName: 'www.gumtree.com/cars',
                                      )));
                        },
                        child: const Text('Gumtree')),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'YOUTUBE VIDEOS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 50),
                        primary: const Color.fromARGB(255, 4, 31, 56)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WebPage(
                                    siteName:
                                        'www.youtube.com/watch?v=9N4RpohW-hU',
                                  )));
                    },
                    child: const Text(
                      'WHAT IS A GOOD DEAL WHEN \nBUYING A USED CAR',
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 50),
                        primary: const Color.fromARGB(255, 4, 31, 56)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WebPage(
                                    siteName:
                                        'www.youtube.com/watch?v=gtkQUqk55kc',
                                  )));
                    },
                    child: const Text('HOW TO BUY A USED CAR IN 2022')),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 50),
                        primary: const Color.fromARGB(255, 4, 31, 56)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WebPage(
                                    siteName:
                                        'www.youtube.com/watch?v=PfXKlwGTabY',
                                  )));
                    },
                    child: const Text('TOP 10 SECOND-HAND AND USED CAR')),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
