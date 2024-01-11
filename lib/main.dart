import 'package:flutter/material.dart';

import 'CardDesign.dart';

void main() {
  runApp(MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Metropolis',
        scaffoldBackgroundColor: Color.fromRGBO(249, 249, 249, 1),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _totalAmount = 0;

  void increaseAmount(int val) {
    _totalAmount += val;
    setState(() {});
  }

  void decreaseAmount(int val) {
    _totalAmount -= val;
    setState(() {});
  }

  List itemList = [
    CardDesign(
      itemTitle: "Pullover",
      itemColor: "Black",
      itemSize: "L",
      itemQuantity: 0,
      itemPrice: 51,
      itemUrl: "assets/images/pullover.png",
    ),
    CardDesign(
      itemTitle: "T-Shirt",
      itemColor: "Gray",
      itemSize: "L",
      itemQuantity: 0,
      itemPrice: 30,
      itemUrl: "assets/images/t_shirt.png",
    ),
    CardDesign(
      itemTitle: "Sport Dress",
      itemColor: "Black",
      itemSize: "M",
      itemQuantity: 0,
      itemPrice: 43,
      itemUrl: "assets/images/sport_dress.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.search, size: 25),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Bag",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => itemList[index],
                  separatorBuilder: (context, index) => Divider(
                        height: 15,
                        color: Colors.transparent,
                      ),
                  itemCount: itemList.length),
            ),
            Row(
              children: [
                Text(
                  "Total amount",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  "${_totalAmount}\$",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Congratulation!"),
                    duration: Duration(milliseconds: 1500),
                  ));
                },
                child: Text(
                  "CHECK OUT",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
