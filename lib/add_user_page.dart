import 'package:db/database.dart';
import 'package:db/model/department_model.dart';
import 'package:db/model/designation_model.dart';
import 'package:db/model/person_model.dart';
import 'package:db/user_list_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddUser extends StatefulWidget {
  late PersonModel? moperson;

  AddUser({required this.moperson});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  late DepartmentModel model;
  late DesignationModel model1;
  bool isGetDepartment = true;
  bool isGetDesignation = true;
  DateTime selectedDate = DateTime.now();
  final formkey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  @override
  void initState() {
    super.initState();
    firstNameController =
        TextEditingController(text: widget.moperson?.FirstName.toString());
    lastNameController =
        TextEditingController(text: widget.moperson?.LastName.toString());
    salaryController =
        TextEditingController(text: widget.moperson?.Salary.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                getFromField(
                    'First Name', firstNameController, TextInputType.name),
                getFromField(
                    'Last Name', lastNameController, TextInputType.name),
                getFromField('Salary', salaryController, TextInputType.number),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.blue,
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Joining Date : ',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            getFormattedDate(selectedDate),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                  onTap: pickDateDialog,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: FutureBuilder<List<DepartmentModel>>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        if (isGetDepartment) {
                          model = snapshot.data![getDepartmentSelectedIndex(
                              snapshot.data!, widget.moperson?.DepartmentID)];
                        }
                        return DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            items: snapshot.data!
                                .map(
                                    (item) => DropdownMenuItem<DepartmentModel>(
                                          value: item,
                                          child: Text(
                                            item.DepartmentName.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                .toList(),
                            value: model,
                            onChanged: (value) {
                              setState(() {
                                isGetDepartment = false;
                                model = value!;
                                print(
                                    'Data Set ${model.DepartmentName.toString()}');
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.black87,
                            buttonHeight: 50,
                            buttonWidth: 160,
                            buttonPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white54,
                            ),
                            buttonElevation: 2,
                            itemHeight: 40,
                            itemPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 160,
                            dropdownWidth: double.infinity,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white54,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(-20, 0),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                    future: isGetDepartment
                        ? MyDb().getDataFromDepartmentTable()
                        : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: FutureBuilder<List<DesignationModel>>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        if (isGetDesignation) {
                          model1 = snapshot.data![getDesignationSelectedIndex(
                              snapshot.data!, widget.moperson?.DesignationID)];
                        }
                        return DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            items: snapshot.data!
                                .map((item) =>
                                    DropdownMenuItem<DesignationModel>(
                                      value: item,
                                      child: Text(
                                        item.DesignationName.toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: model1,
                            onChanged: (value) {
                              setState(() {
                                isGetDesignation = false;
                                model1 = value!;
                                print(
                                    'Data Set ${model1.DesignationName.toString()}');
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.black87,
                            buttonHeight: 50,
                            buttonWidth: 160,
                            buttonPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white54,
                            ),
                            buttonElevation: 2,
                            itemHeight: 40,
                            itemPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 160,
                            dropdownWidth: double.infinity,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white54,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(-20, 0),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                    future: isGetDesignation
                        ? MyDb().getDataFromDesignationTable()
                        : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(1000))
                      //more than 50% of width makes circle
                      ),
                  child: TextButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (formkey.currentState!.validate()) {
                        await MyDb().upsertIntoPersonTable(
                          fName: firstNameController.text.toString(),
                          lName: lastNameController.text.toString(),
                          salary: salaryController.text.toString(),
                          jDate: selectedDate.toString(),
                          departmentId: model.DepartmentID.toString(),
                          designationId: model1.DesignationID.toString(),
                          wId: widget.moperson != null
                              ? widget.moperson!.WorkerID
                              : -1,
                        );
                        print('Fname :: ${firstNameController.text.toString()}\n' +
                            'Lname :: ${lastNameController.text.toString()}\n' +
                            'Salary :: ${salaryController.text.toString()}\n' +
                            'Jdate :: ${selectedDate.toString()}\n' +
                            'Depart :: ${model.DepartmentID.toString()}\n' +
                            'Desi :: ${model1.DesignationID.toString()}');
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserListPage(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getFormattedDate(dateToFormat) {
    if (dateToFormat != null) {
      return DateFormat('dd-MM-yyyy').format(dateToFormat).toString();
    } else {
      return DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
    }
  }

  void pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  Widget getFromField(String title, control, keyboardType) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter valid $title';
          }
        },
        controller: control,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: (title),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }

  int getDepartmentSelectedIndex(
      List<DepartmentModel> list, int? departmentID) {
    if (departmentID == null) {
      return 0;
    } else {
      for (int i = 0; i < list.length; i++) {
        if (list[i].DepartmentID == departmentID) {
          return i;
        }
      }
    }
    return 0;
  }

  int getDesignationSelectedIndex(
      List<DesignationModel> list, int? designationID) {
    if (designationID == null) {
      return 0;
    } else {
      for (int i = 0; i < list.length; i++) {
        if (list[i].DesignationID == designationID) {
          return i;
        }
      }
    }
    return 0;
  }
}
