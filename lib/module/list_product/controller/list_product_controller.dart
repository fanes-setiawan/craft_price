import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../view/list_product_view.dart';

class ListProductController extends State<ListProductView> {
  static late ListProductController instance;
  late ListProductView view;

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
