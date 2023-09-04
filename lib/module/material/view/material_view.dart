import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../controller/material_controller.dart';

class MaterialView extends StatefulWidget {
  const MaterialView({Key? key}) : super(key: key);

  Widget build(context, MaterialController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Material"),
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
  State<MaterialView> createState() => MaterialController();
}
