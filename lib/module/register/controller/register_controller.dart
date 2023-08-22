import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../view/register_view.dart';

class RegisterController extends State<RegisterView> {
  static late RegisterController instance;
  late RegisterView view;
  bool obscureState = true;
  bool isLoading = false; // Status loading
  String? email;
  String? password;

  visibilitySt() {
    obscureState = !obscureState;
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
