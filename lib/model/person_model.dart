class PersonModel {
  late int _WorkerID;
  late String _FirstName;
  late String _LastName;
  late int _Salary;
  late String _JoiningDate;
  late int _DepartmentID;
  late int _DesignationID;
  late String _DepartmentName;
  late String _DesignationName;
  late bool _isFavouritUser;

  bool get isFavouritUser => _isFavouritUser;

  set isFavouritUser(bool isFavouritUser) {
    _isFavouritUser = isFavouritUser;
  }

  String get DesignationName => _DesignationName;

  set DesignationName(String DesignationName) {
    _DesignationName = DesignationName;
  }
  String get DepartmentName => _DepartmentName;

  set DepartmentName(String DepartmentName) {
    _DepartmentName = DepartmentName;
  }


  int get WorkerID => _WorkerID;

  set WorkerID(int WorkerID) {
    _WorkerID = WorkerID;
  }

  String get FirstName => _FirstName;

  set FirstName(String FirstName) {
    _FirstName = FirstName;
  }

  String get LastName => _LastName;

  set LastName(String LastName) {
    _LastName = LastName;
  }


  int get Salary => _Salary;

  set Salary(int Salary) {
    _Salary = Salary;
  }

  String get JoiningDate => _JoiningDate;

  set JoiningDate(String JoiningDate) {
    _JoiningDate = JoiningDate;
  }

  int get DepartmentID => _DepartmentID;

  set DepartmentID(int DepartmentID) {
    _DepartmentID = DepartmentID;
  }

  int get DesignationID => _DesignationID;

  set DesignationID(int DesignationID) {
    _DesignationID = DesignationID;
  }
}
