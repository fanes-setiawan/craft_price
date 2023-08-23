import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import 'package:intl/intl.dart';
import '../controller/list_product_controller.dart';

class ListProductView extends StatefulWidget {
  const ListProductView({Key? key}) : super(key: key);

  Widget build(context, ListProductController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Harga Product",
            style: TextStyle(
              color: myBGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection("products")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return const Text("Error");
              if (snapshot.data == null) return Container();
              if (snapshot.data!.docs.isEmpty) {
                return const Text("No Data");
              }
              final data = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.docs.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  Map<String, dynamic> item =
                      (data.docs[index].data() as Map<String, dynamic>);
                  item["id"] = data.docs[index].id;
                  return Card(
                    child: Container(
                      height: 140,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            width: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  item["photo"],
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                item["price"] >= 50000
                                    ? Positioned(
                                        right: 3,
                                        top: 3,
                                        child: Container(
                                          height: 30.0,
                                          width: 30.0,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/premium.png"),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                8.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "${item["name_product"]}",
                                    style: TextStyle(
                                      color: myBGreen,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  height: 70,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: myBGreen,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Harga",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: myWhite,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Rp ${NumberFormat.decimalPattern('id-ID').format(item["price"])}",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: myWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 50,
                                        width: 0.6,
                                        decoration: BoxDecoration(
                                          color: myGrey,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Ukuran",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: myWhite,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${item["size"]}",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: myWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }

  @override
  State<ListProductView> createState() => ListProductController();
}
