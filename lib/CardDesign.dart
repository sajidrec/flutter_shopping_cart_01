import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  final itemTitle, itemColor, itemSize, itemQuantity, itemPrice, itemUrl;

  const CardDesign({
    super.key,
    required this.itemTitle,
    required this.itemColor,
    required this.itemSize,
    required this.itemQuantity,
    required this.itemPrice,
    required this.itemUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    itemUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(7),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment:
                      //     MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${itemTitle}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                              children: [
                                TextSpan(text: "Color: "),
                                TextSpan(
                                  text: "${itemColor}",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                              children: [
                                TextSpan(text: "Size: "),
                                TextSpan(
                                  text: "${itemSize}",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_rounded),
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
                                "${itemQuantity}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_rounded),
                              color: Colors.black54,
                              style: IconButton.styleFrom(
                                  elevation: 2,
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.white),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Text(
                            "${itemPrice}\$",
                            style: TextStyle(
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
    );
  }
}
