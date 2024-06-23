import 'package:flutter/material.dart';

class DataSelectedProvider extends ChangeNotifier {
  // Selected departmetn
  String _selectedDepartment = "No selected";

  String get selectedDepartment => _selectedDepartment;

  void getSelectedDepartmant(String department) {
    _selectedDepartment = department;
    print(_selectedDepartment);
    notifyListeners();
  }


   String _selectedStaffMember = "No selected";

  String get selectedStaffMember => _selectedStaffMember;

  void getSelectedStaffMember(String staff) {
    _selectedStaffMember = staff;
    print(_selectedStaffMember);
    notifyListeners();
  }
}
