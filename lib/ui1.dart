import 'package:db/database.dart';
import 'package:db/ui_page_2.dart';
import 'package:flutter/material.dart';

class Ui1 extends StatefulWidget {
  @override
  State<Ui1> createState() => _Ui1State();
}

class _Ui1State extends State<Ui1> {
  @override
  void initState() {
    super.initState();
    MyDb().copyPasteAssetFileToRoot().then((value) => print('DEMO DATABASE'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.menu),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'English',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/IMG_1981.jpg'),
                    ),
                    height: 40,
                    width: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dhrumit Jadav',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Text(
                              'Jamnagar',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 20),
                      child: Text(
                        'Welcome back!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 30),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(35)),
                                          child: Text('  abcabc  '),
                                          color: Color(0x99D1FFFF),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 20),
                                        child: Text(
                                          'Today\'s\nChallenge',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 30,
                                              fontFamily: 'BebasNeue'),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'German',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.cyanAccent),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: Image.asset(
                                      'assets/images/man.png',
                                      height: 200,
                                      width: 200,
                                    ),
                                  )
                                ],
                              ),
                              elevation: 10,
                            ),
                          ),
                          flex: 50,
                        ),
                        Expanded(child: Container())
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              // ignore: sort_child_properties_last
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 20),
                    child: const Text(
                      'Your courses',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          getCard('Spanish', 'asdfasdf', Colors.brown),
                          getCard('Russian', 'Advance', Colors.deepOrange),
                          getCard('Turkish', 'asdfasdf', Colors.blue),
                          getCard('French', 'asdfasdf', Colors.pink),
                          getCard('German', 'asdfasdf', Colors.teal),
                          getCard('Hindi', 'asdf', Colors.indigo)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget getCard(String title, String sub, color) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(color, title);
            },
          ),
        );
      },
      child: Container(
        height: 100,
        width: 120,
        child: Card(
          color: color,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(11, 2, 0, 0),
                    child: Text(
                      sub,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}