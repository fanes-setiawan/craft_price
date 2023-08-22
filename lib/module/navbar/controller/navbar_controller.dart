import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../view/navbar_view.dart';

class NavbarController extends State<NavbarView> {
  static late NavbarController instance;
  late NavbarView view;
  int selectedIndex = 0;
  onTap(int index) {
    selectedIndex = index;
    setState(() {});
  }

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
