import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: myBGreen,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: controller.dayList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.dayList[index];
                      return Padding(
                        padding: const EdgeInsets.all(6.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 20,
                              height: item["height"],
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: item["day"] ==
                                        controller
                                            .getFormattedDate()
                                            .toLowerCase()
                                    ? myYell
                                    : myWGreen,
                              ),
                            ),
                            Text(
                              item["day"],
                              style: TextStyle(
                                color: item["day"] ==
                                        controller
                                            .getFormattedDate()
                                            .toLowerCase()
                                    ? myYell
                                    : myWGreen,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Builder(builder: (context) {
                  List categories = [
                    {
                      "onTap": () {},
                      "label": "Catatan",
                      "image":
                          "https://ds393qgzrxwzn.cloudfront.net/resize/c700x700/cat1/img/images/0/0L07HGCpVu.jpg",
                    },
                    {
                      "onTap": () {},
                      "label": "Kariawan",
                      "image":
                          "https://blog.kini.id/wp-content/uploads/2021/08/KINI.id-7-1568x882.jpg",
                    },
                    {
                      "onTap": () {},
                      "label": "Bahan",
                      "image":
                          "https://beadaily.com/wp-content/uploads/2023/05/Kawat-Tembaga.jpg.webp",
                    },
                    {
                      "onTap": () {},
                      "label": "Hitung Hasil",
                      "image":
                          "https://www.talenta.co/wp-content/uploads/2021/03/uang-pesangon-karyawan-1024x683.jpg",
                    },
                  ];

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = categories[index];
                      return InkWell(
                        onTap: item["onTap"],
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                item["image"],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    item["label"] == "Catatan"
                                        ? Icon(
                                            Icons.add,
                                            size: 28.0,
                                            color: myWhite,
                                          )
                                        : Container(),
                                    Text(
                                      item["label"],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
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
                }),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Divider(),
              const SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "\$ Save Harga",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: myGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 15.0),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: controller.products.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = controller.products[index];
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
                                      Positioned(
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item["product_name"],
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                  "Rp ${item["price"]}",
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
                                                  "besar",
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
                    ),
                  ],
                ),
              )
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: 170.0,
              //         child: Builder(builder: (context) {
              //           List<Map<String, dynamic>> listButton = [
              //             {
              //               "title": "Harga",
              //               "color": myBGreen,
              //               "onTap": () {},
              //             },
              //             {
              //               "title": "Bahan",
              //               "color": myYell,
              //               "onTap": () {},
              //             },
              //             {
              //               "title": "Bahan",
              //               "color": myBGreen,
              //               "onTap": () {},
              //             }
              //           ];
              //           return ListView.builder(
              //             itemCount: listButton.length,
              //             scrollDirection: Axis.horizontal,
              //             padding: EdgeInsets.zero,
              //             clipBehavior: Clip.none,
              //             itemBuilder: (context, index) {
              //               var item = listButton[index];
              //               return Padding(
              //                 padding: const EdgeInsets.only(right: 10),
              //                 child: Container(
              //                   width:
              //                       MediaQuery.of(context).size.width / 2 - 50,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10),
              //                     color: item["color"],
              //                   ),
              //                 ),
              //               );
              //             },
              //           );
              //         }),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
