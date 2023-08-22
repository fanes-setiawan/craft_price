import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../controller/add_product_controller.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({Key? key}) : super(key: key);

  Widget build(context, AddProductController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("AddProduct"),
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
  State<AddProductView> createState() => AddProductController();
}
