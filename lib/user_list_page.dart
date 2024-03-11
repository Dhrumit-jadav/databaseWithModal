import 'package:db/add_user_page.dart';
import 'package:db/fav_user_page.dart';
import 'package:db/model/person_model.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<Map<String, Object?>>> userListFuture;
  List<PersonModel> localList = [];
  List<PersonModel> searchList = [];
  List<PersonModel> favList = [];
  bool isGetData = true;
  TextEditingController controller = TextEditingController();

  // Offset _tapPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Worker Information')),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FavUser(favList),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AddUser(
                        moperson: null,
                      );
                    },
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child:  Icon(
                  Icons.add,
                )
              ),
            ),
          ],
        ),
        body: FutureBuilder<List<PersonModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (isGetData) {
                localList.addAll(snapshot.data!);
                searchList.addAll(localList);
              }
              isGetData = false;
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search_rounded),
                          hintText: 'Search using First Name'),
                      controller: controller,
                      onChanged: (value) {
                        searchList.clear();
                        for (int i = 0; i < localList.length; i++) {
                          if (localList[i]
                              .FirstName
                              .toLowerCase()
                              .contains(value.toLowerCase())) {
                            searchList.add(localList[i]);
                          }
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddUser(moperson: searchList[index]),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(
                                          () {
                                        searchList[index].isFavouritUser =
                                        !searchList[index].isFavouritUser;
                                      },
                                    );
                                    if (searchList[index].isFavouritUser ==
                                        true) {
                                      favList.add(searchList[index]);
                                      print(
                                          '${favList[index].FirstName}.is ');
                                    } else {
                                      favList.remove(searchList[index]);
                                    }
                                  },
                                  child: Icon(
                                    searchList[index].isFavouritUser
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 24,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                      searchList[index].WorkerID.toString()),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(searchList[index]
                                            .FirstName
                                            .toString()),
                                      ),
                                      Container(
                                        padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                        child: Text(
                                          searchList[index]
                                              .LastName
                                              .toString(),
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        searchList[index].Salary.toString()),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(searchList[index]
                                        .JoiningDate
                                        .toString()
                                        .substring(0, 10)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          searchList[index]
                                              .DesignationName
                                              .toString(),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                        child: Text(
                                          searchList[index]
                                              .DepartmentName
                                              .toString(),
                                          style: const TextStyle(fontSize: 10),
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
                                InkWell(
                                  onTap: () {
                                    showAlertDialog(context, index);
                                  },
                                  child: const Icon(
                                    Icons.delete_rounded,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: searchList.length,
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('No User Found'),
              );
            }
          },
          future: isGetData ? MyDb().getDataFromPersonTable() : null,
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, index) {
    Widget yesButton = TextButton(
      child: const Text("Yes"),
      onPressed: () async {
        int deletedPersonID = await MyDb()
            .deletePersonFromPersonTable(searchList[index].WorkerID);
        if (deletedPersonID > 0) {
          searchList.removeAt(index);
          print('Person on index ${index} is  Successfully Deleted');
        }
        Navigator.pop(context);
        setState(() {});
      },
    );
    Widget noButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: const Text("Are you sure want to delete?"),
      actions: [
        yesButton,
        noButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

// void showContextMenu(context, index) async {
//   final RenderObject? overlay =
//   Overlay.of(context)?.context.findRenderObject();
//   final result = await showMenu(
//     context: context,
//     position: RelativeRect.fromRect(
//         Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 10, 10),
//         Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
//             overlay!.paintBounds.size.height)),
//     items: [
//       PopupMenuItem(
//         child: InkWell(
//           onTap: () {
//             showAlertDialog(context, index);
//           },
//           child: Row(
//             children: [
//               Icon(
//                 Icons.delete_rounded,
//                 color: Colors.red,
//                 size: 24,
//               ),
//               Text('Delete')
//             ],
//           ),
//         ),
//         value: 'delete',
//       ),
//       // PopupMenuItem(
//       //   child: InkWell(
//       //     onTap: () {
//       //       Navigator.of(context).push(
//       //         MaterialPageRoute(
//       //           builder: (context) =>
//       //               AddUser(moperson: localList![index])
//       //         ),
//       //       );
//       //     },
//       //     child: Row(
//       //       children: [
//       //         Icon(
//       //           Icons.update,
//       //           color: Colors.blue,
//       //           size: 24,
//       //         ),
//       //         Text('Update'),
//       //       ],
//       //     ),
//       //   ),
//       //   value: 'update',
//       // ),
//     ],
//   );
//   switch (result) {
//     case 'delete':
//       print('Delete');
//       break;
//
//   // case 'update':
//   //   print('Update');
//   //   break;
//   }
// }

// void getTapPosition(TapDownDetails tapPosition) {
//   final RenderBox renderBox = context.findRenderObject() as RenderBox;
//   setState(() {
//     _tapPosition = renderBox.globalToLocal(tapPosition.globalPosition);
//     print('${_tapPosition}');
//   });
// }

}
