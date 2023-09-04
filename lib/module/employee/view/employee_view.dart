import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../controller/employee_controller.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({Key? key}) : super(key: key);

  Widget build(context, EmployeeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<EmployeeView> createState() => EmployeeController();
}
