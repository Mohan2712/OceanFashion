import 'package:flutter/material.dart';

import '../Model/AllData.dart';

class ProductPage extends StatefulWidget {
  List<Datum>? data;
  String? image;
  ProductPage({Key? key, required this.data, required this.image})
      : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Product Page",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black54,
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  itemCount: widget.data?.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 1.5,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      widget.image.toString(),
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 150,
                                    ))),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.black54,
                                )),
                            Positioned(
                              top: 160,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            widget.data![index].title
                                                .toString(),
                                            maxLines: 3,
                                            overflow: TextOverflow.fade,
                                            textAlign: TextAlign.center),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\$',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          widget.data![index].price.toString(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 240,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
