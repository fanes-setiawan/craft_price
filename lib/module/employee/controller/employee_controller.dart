import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../view/employee_view.dart';

class EmployeeController extends State<EmployeeView> {
  static late EmployeeController instance;
  late EmployeeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
