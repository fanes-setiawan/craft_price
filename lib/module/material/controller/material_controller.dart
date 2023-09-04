import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../view/material_view.dart';

class MaterialController extends State<MaterialView> {
  static late MaterialController instance;
  late MaterialView view;

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
