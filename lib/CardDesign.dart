import 'package:flutter/material.dart';
import 'package:flutter_shoping_cart/TotalAmount.dart';
import 'package:provider/provider.dart';

class CardDesign extends StatefulWidget {
  final itemTitle, itemColor, itemSize, itemUrl;
  int itemQuantity, showPrice = 0, itemPrice;

  CardDesign({
    super.key,
    required this.itemTitle,
    required this.itemColor,
    required this.itemSize,
    required this.itemQuantity,
    required this.itemPrice,
    required this.itemUrl,
  }) : showPrice = itemQuantity * itemPrice;

  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => SizedBox(
        width: double.infinity,
        height: 136,
        child: Card(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          elevation: 2,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      widget.itemUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment:
                        //     MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.itemTitle}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_vert_rounded,
                            color: Colors.grey,
                            size: 28,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                                children: [
                                  const TextSpan(text: "Color: "),
                                  TextSpan(
                                    text: "${widget.itemColor}",
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                                children: [
                                  const TextSpan(text: "Size: "),
                                  TextSpan(
                                    text: "${widget.itemSize}",
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (widget.itemQuantity > 0) {
                                    final totalAmount =
                                        context.read<TotalAmount>();
                                    totalAmount
                                        .decreaseAmount(widget.itemPrice);

                                    widget.itemQuantity--;
                                    widget.showPrice -= widget.itemPrice;
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.remove_rounded),
                                color: Colors.black54,
                                style: IconButton.styleFrom(
                                    elevation: 3,
                                    backgroundColor: Colors.white,
                                    shadowColor: Colors.white),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "${widget.itemQuantity}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black54),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  final totalAmount =
                                      context.read<TotalAmount>();
                                  totalAmount.increaseAmount(widget.itemPrice);

                                  widget.itemQuantity++;
                                  widget.showPrice += widget.itemPrice;

                                  if (widget.itemQuantity == 5) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        surfaceTintColor: Colors.white,
                                        backgroundColor: Colors.white,
                                        title: const Text(
                                          "Congratulations!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Inter"),
                                        ),
                                        content: Text(
                                          "You have added \n5\n${widget.itemTitle} on your bag!",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Inter"),
                                        ),
                                        actions: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red),
                                              child: const Text(
                                                "OKAY",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Inter"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  setState(() {});
                                },
                                icon: const Icon(Icons.add_rounded),
                                color: Colors.black54,
                                style: IconButton.styleFrom(
                                    elevation: 2,
                                    backgroundColor: Colors.white,
                                    shadowColor: Colors.white),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              "${widget.showPrice}\$",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
