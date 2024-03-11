import 'package:db/ui_page_3.dart';
import 'package:db/user_list_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var color;

  // ignore: prefer_typing_uninitialized_variables
  var title;

  DetailPage(this.color, this.title, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      getCot(widget.color),
                      getTitle(widget.title),
                    ],
                  ),
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
              bottomLeft: Radius.circular(5000),
              bottomRight: Radius.circular(5000))
          //more than 50% of width makes circle
          ),
    );
  }

  Widget getTitle(title) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30, top: 50),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'CaviarDreams'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCard(Icons.document_scanner, 'Basics', Colors.yellow),
                    getCard(Icons.backpack_rounded, 'Occupations',
                        Colors.pinkAccent)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCard(Icons.message, 'Conversations', Colors.blueAccent),
                    getCard(Icons.location_on, 'Places', Colors.green)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCard(Icons.dataset, 'Database', Colors.purple,
                        UserListPage()),
                    getCard(Icons.api, 'API', Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCard(icon, String subtitle, color, [Nav]) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Nav ?? IconDetailPage(color, subtitle);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 30, top: 20),
        child: Card(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )
            ],
          ),
          elevation: 20,
        ),
        height: 120,
        width: 120,
      ),
    );
  }
}
