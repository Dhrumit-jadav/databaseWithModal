import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconDetailPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var color;

  // ignore: prefer_typing_uninitialized_variables
  var subtitle;

  IconDetailPage(this.color, this.subtitle, {super.key});

  @override
  State<IconDetailPage> createState() => _IconDetailPageState();
}

class _IconDetailPageState extends State<IconDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.loose,
                children: [
                  getCot(widget.color),
                  Center(child: getTitle(widget.subtitle, 42.0)),
                  SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 150),
                            height: 300,
                            width: 300,
                            child: Card(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.only(
                                                top: 10, left: 10),
                                            child: const RotatedBox(
                                                quarterTurns: 2,
                                                child: Icon(Icons
                                                    .format_quote_rounded))),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.topRight,
                                            margin: const EdgeInsets.only(
                                                top: 10, right: 10),
                                            child: const Icon(
                                              Icons.message,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                      'ASDF ASDF ASDF asdf\nasdf asdf asdf asdf\nasdf asdf asdf asdf \nasdf asdf asdf asdf \nasdf asdf asdf asdf ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'BebasNeue',
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.bottomRight,
                                        margin: const EdgeInsets.only(
                                            bottom: 10, right: 10),
                                        child: const Icon(
                                            Icons.format_quote_rounded)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 80,
                            width: 300,
                            child: const Card(
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Enter your answer...'),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            height: 60,
                            width: 60,
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              child: TextButton(
                                onPressed: () {
                                  print('Button Pressed');
                                  FocusScope.of(context).unfocus();
                                },
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCot(color) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(1000),
              bottomRight: Radius.circular(1000))
          //more than 50% of width makes circle
          ),
    );
  }

  Widget getTitle(subtitle, [fSize]) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: fSize ?? 50,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
