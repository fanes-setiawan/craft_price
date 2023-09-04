import 'package:craft_product/utils/widget/q_image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../controller/add_product_controller.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({Key? key}) : super(key: key);

  Widget build(context, AddProductController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              QImagePicker(
                label: "add_product",
                onChanged: (value) {
                  controller.photo = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              FormText(
                hintText: "Nama Produk",
                obscureText: false,
                onPressed: (value) {
                  controller.nama_product = value;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              FormText(
                hintText: "Harga",
                keyboardType: TextInputType.number,
                obscureText: false,
                onPressed: (value) {
                  controller.price = int.parse(value);
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              FormText(
                hintText: "Ukuran",
                obscureText: false,
                onPressed: (value) {
                  controller.size = value;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                cursorColor: Colors.black,
                cursorWidth: 1,
                maxLines: null,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  hintText: "Description",
                  fillColor: Colors.grey[200],
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                ),
                onChanged: (value) {
                  controller.description = value;
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: InkWell(
          onTap: () {
            controller.doUpload(FirebaseAuth.instance.currentUser!.uid);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            decoration: BoxDecoration(
              color: myBGreen,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.save_outlined,
                  size: 30.0,
                  color: myWhite,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Simpan",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: myWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<AddProductView> createState() => AddProductController();
}
