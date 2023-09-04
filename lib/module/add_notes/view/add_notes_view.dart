import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../controller/add_notes_controller.dart';

class AddNotesView extends StatefulWidget {
  const AddNotesView({Key? key}) : super(key: key);

  Widget build(context, AddNotesController controller) {
    controller.view = this;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Tambahkan Catatan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: myBGreen,
              ),
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: controller.tabController,
              tabs: const [
                Tab(
                  text: "Bahan",
                ),
                Tab(
                  text: "Kariawan",
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: [
              Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        FormText(
                          hintText: "Nama Judul",
                          obscureText: false,
                          onPressed: (value) {},
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          // padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(),
                          ),
                          child: TextFormField(
                            // controller: controller.contenEditingController,
                            cursorColor: Colors.blue,
                            cursorWidth: 1,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "masukan nama barang",
                              hintStyle: TextStyle(
                                color: myWGreen,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        FormText(
                          hintText: "nama kariawan",
                          obscureText: false,
                          onPressed: (value) {},
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: FormText(
                                hintText: "barang",
                                obscureText: false,
                                onPressed: (value) {},
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: FormText(
                                keyboardType: TextInputType.number,
                                hintText: "jumlah",
                                obscureText: false,
                                onPressed: (value) {},
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              flex: 2,
                              child: FormText(
                                keyboardType: TextInputType.number,
                                hintText: "harga",
                                obscureText: false,
                                onPressed: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AddNotesView> createState() => AddNotesController();
}
