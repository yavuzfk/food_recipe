import 'package:flutter/material.dart';

import '../../core/atoms/black_divider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  color: Colors.red,
                )),
            Expanded(
                flex: 3,
                child: Container(
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Positioned(
                        bottom: 0,
                        child: SizedBox(
                          height: 252,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            // color: const Color.fromARGB(255, 22, 71, 156),
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Malzemelerin",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white54,
                                          fontWeight: FontWeight.w600)),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: BlackDivider(),
                                  ),
                                  SizedBox(
                                    height: 154,
                                    child: ListView(
                                      children: const [
                                        Text(
                                          "Patates",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Soğan",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Kıyma",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Malzeme 1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Malzeme 1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Malzeme 1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Malzeme 1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Malzeme 1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(255, 221, 223, 228),
                                  // Color.fromARGB(255, 65, 93, 218),
                                  Color.fromARGB(255, 239, 45, 45),
                                  // Colors.blueAccent,
                                  // Color.fromARGB(255, 45, 23, 146),
                                ]),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.57), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  disabledForegroundColor:
                                      Colors.transparent.withOpacity(0.38),
                                  disabledBackgroundColor:
                                      Colors.transparent.withOpacity(0.12),
                                  shadowColor: Colors.transparent,
                                  //make color or elevated button transparent
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                label: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 18,
                                    bottom: 18,
                                  ),
                                  child: Text("Malzeme Ekle",
                                      style: TextStyle(
                                        // fontSize: 18,
                                        color: Colors.white,
                                        // fontWeight: FontWeight.w600,
                                      )),
                                ))),
                      ),
                    ),
                  ]),
                )),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  child: Stack(children: [
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        height: 252,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: const Color.fromARGB(255, 22, 71, 156),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Alışveriş Listen",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w600)),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: BlackDivider(),
                                ),
                                SizedBox(
                                  height: 154,
                                  child: ListView(
                                    children: const [
                                      Text(
                                        "Sarımsak alınacak",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Tuz alınacak",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "yarım kilo kuş başı",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Malzeme 1",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Malzeme 1",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Malzeme 1",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Malzeme 1",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Malzeme 1",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.blueAccent,
                                  Color.fromARGB(255, 45, 23, 146),
                                ]),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.57), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  disabledForegroundColor:
                                      Colors.transparent.withOpacity(0.38),
                                  disabledBackgroundColor:
                                      Colors.transparent.withOpacity(0.12),
                                  shadowColor: Colors.transparent,
                                  //make color or elevated button transparent
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                label: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 18,
                                    bottom: 18,
                                  ),
                                  child: Text("Sipariş Ekle",
                                      style: TextStyle(
                                        // fontSize: 18,
                                        color: Colors.white,
                                        // fontWeight: FontWeight.w600,
                                      )),
                                ))),
                      ),
                    ),
                  ]),
                )),
            const SizedBox(
              height: 8,
            ),
          ],
        )));
  }
}
