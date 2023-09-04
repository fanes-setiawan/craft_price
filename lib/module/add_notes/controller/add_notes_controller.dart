import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../view/add_notes_view.dart';

class AddNotesController extends State<AddNotesView> {
  static late AddNotesController instance;
  late AddNotesView view;
  TabController? tabController;

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
