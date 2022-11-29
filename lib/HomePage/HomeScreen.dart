import 'package:flutter/material.dart';
import 'package:oceanfashion/apiclient.dart';

import '../Model/AllData.dart';
import 'ProductPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Datum>? datas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<AllData>(
            future: ApiClient().fetchUsersApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Loaded(snapshot.data!.data!);
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }

              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget Loaded(List<Datum> data) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "Home Page",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black54)))),
            onPressed: () {
              mensdata(data);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            data: datas,
                            image: 'assets/menfashion.jpg',
                          )));
            },
            child: Text("Men's Fashion")),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black54)))),
            onPressed: () {
              womensData(data);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            data: datas,
                            image: "assets/womensfashion.jpg",
                          )));
            },
            child: Text("Women's Fashion")),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black54)))),
            onPressed: () {
              furniture(data);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            data: datas,
                            image: 'assets/furniture.jpg',
                          )));
            },
            child: Text("Furniture")),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black54)))),
            onPressed: () {
              electronics(data);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            data: datas,
                            image: 'assets/computer.jpg',
                          )));
            },
            child: Text("Electronics")),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black54)))),
            onPressed: () {
              phone(data);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            data: datas,
                            image: 'assets/phone.jpg',
                          )));
            },
            child: Text("Phones and Tablets")),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black54)))),
            onPressed: () {
              tools(data);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            data: datas,
                            image: 'assets/tools.jpg',
                          )));
            },
            child: Text("Tools and Hardware"))
      ],
    );
  }

  void mensdata(List<Datum> data) {
    List<Datum> fashiondata = data
        .where((element) => element.category?.name == "men's fashion")
        .toList();
    datas = fashiondata;
  }

  void womensData(List<Datum> data) {
    List<Datum> fashiondata = data
        .where((element) =>
            element.category?.name == "women's fashion" ||
            element.category?.name == "jewlary & watches")
        .toList();
    datas = fashiondata;
  }

  void furniture(List<Datum> data) {
    List<Datum> fashiondata = data
        .where((element) => element.category?.name == "home & furniture")
        .toList();
    datas = fashiondata;
  }

  void electronics(List<Datum> data) {
    List<Datum> fashiondata =
        data.where((element) => element.category?.name == "computers").toList();
    datas = fashiondata;
  }

  void phone(List<Datum> data) {
    List<Datum> fashiondata = data
        .where((element) => element.category?.name == "phone & tablets")
        .toList();
    datas = fashiondata;
  }

  void tools(List<Datum> data) {
    List<Datum> fashiondata = data
        .where((element) => element.category?.name == "tools & hardware")
        .toList();
    datas = fashiondata;
  }
}
