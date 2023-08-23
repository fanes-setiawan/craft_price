import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import 'package:intl/intl.dart';
import '../view/add_product_view.dart';

class AddProductController extends State<AddProductView> {
  static late AddProductController instance;
  late AddProductView view;
  bool isLoading = false;

  String getFormattedDate() {
    var now = DateTime.now();
    var formatter =
        DateFormat('EEEE, dd/MM/yyyy HH:mm'); // 'id' for Indonesian locale
    return formatter.format(now);
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

  String? photo;
  String? nama_product;
  int? price;
  String? size;
  String? description;

  doUpload(String userId) async {
    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("products")
          .add({
        "photo": photo ?? '',
        "price": price ?? 0,
        "size": size ?? "",
        "description": description ?? "",
        "name_product": nama_product ?? "",
        "time": getFormattedDate(),
      });

      setState(() {
        isLoading = false;
      });

      Get.to(NavbarView());
    } catch (e) {
      print(e);
    }
  }
}
