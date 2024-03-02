import 'package:flutter/material.dart';

class FavUser extends StatefulWidget {
  List<dynamic> l = [];

  FavUser(this.l);

  @override
  State<FavUser> createState() => _FavUserState();
}

class _FavUserState extends State<FavUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fav user',style: TextStyle(),),
        ),
        body: ListView.builder(
          itemCount: widget.l.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
                    padding: EdgeInsets.all(5),
                    child: Text(widget.l[index].WorkerID.toString()),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(widget.l[index].FirstName.toString()),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Text(
                            widget.l[index].LastName.toString(),
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(widget.l[index].Salary.toString()),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(widget.l[index].JoiningDate
                          .toString()
                          .substring(0, 10)),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            widget.l[index].DesignationName.toString(),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Text(
                            widget.l[index].DepartmentName.toString(),
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.grey.shade500,
                      size: 24,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
