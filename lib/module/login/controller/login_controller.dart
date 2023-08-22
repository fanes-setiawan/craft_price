import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;
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
