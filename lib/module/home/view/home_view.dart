import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
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
                      "onTap": () {
                        Get.to(const ListProductView());
                      },
                      "label": "Harga Produk",
                      "image":
                          "https://api2.kemenparekraf.go.id/storage/app/uploads/public/627/48d/76a/62748d76ac397255237309.jpg",
                    },
                  ];
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
