import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoping_cart/DB/DB.dart';
import 'package:flutter_shoping_cart/TotalAmount.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => ChangeNotifierProvider(
      create: (context) => TotalAmount(),
      child: const MyMaterialApp(),
    ),
  ));
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Metropolis',
        scaffoldBackgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        useMaterial3: true,
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
  List itemList = DB.items;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.microtask(() {
      int totalPrice = 0;

      for (var element in itemList) {
        totalPrice += int.parse(element.itemPrice.toString()) *
            int.parse(element.itemQuantity.toString());
      }

      Provider.of<TotalAmount>(context, listen: false)
          .increaseAmount(totalPrice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TotalAmount>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.search, size: 25),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Bag",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => itemList[index],
                    separatorBuilder: (context, index) => const Divider(
                          height: 15,
                          color: Colors.transparent,
                        ),
                    itemCount: itemList.length),
              ),
              Row(
                children: [
                  const Text(
                    "Total amount",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    "${value.totalAmount.toString()}\$",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Congratulation!"),
                        duration: Duration(milliseconds: 1500),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, elevation: 3),
                    child: const Text(
                      "CHECK OUT",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
