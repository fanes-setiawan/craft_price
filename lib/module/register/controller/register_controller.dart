import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../view/register_view.dart';

class RegisterController extends State<RegisterView> {
  static late RegisterController instance;
  late RegisterView view;
  bool obscureState = true;
  bool isLoading = false; // Status loading
  final FirebaseAuth auth = FirebaseAuth.instance;

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
  String? name;
  String? email;
  String? password;

  doRegEmail() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      final User? user = auth.currentUser;
      if (user != null) {
        final FirebaseFirestore db = FirebaseFirestore.instance;
        try {
          await db.collection("users").doc(user.uid).set({
            'name': name,
            'email': email,
            'password': password,
            'id': FirebaseAuth.instance.currentUser!.uid,
          });
        } on Exception catch (err) {
          print(err);
        }
      }
      Get.to(LoginView());
      setState(() {
        isLoading = false;
      });
    } on Exception catch (err) {
      print("signup gagal: ${err}");
    }
  }
}
