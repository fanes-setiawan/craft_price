import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return StreamBuilder<DocumentSnapshot<Object?>>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text("Error");
        if (!snapshot.hasData) return const Text("No Data");
        Map<String, dynamic> item =
            (snapshot.data!.data() as Map<String, dynamic>);
        item["id"] = snapshot.data!.id;
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CircleAvatar(
                  radius: 3.0,
                  backgroundColor: Colors.green,
                ),
                const SizedBox(
                  width: 3.0,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    color: myBlack,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item["name"],
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item["email"],
                    style: TextStyle(
                      fontSize: 9.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  item["photo"] ??
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: myWGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 110.0,
                            width: 110.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/logo.png"),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: myBGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Produk",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: myWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "3",
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
                                      "Harga Tertinggi",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: myWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Rp 300.000.00",
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
                                      "Harga Terendah",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: myWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Rp 50.000.00",
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Builder(builder: (context) {
                    List<Map<String, dynamic>> buttonList = [
                      {
                        "title": "Edit Profil",
                        "icon": Icons.edit,
                        "onTap": () {},
                      },
                      {
                        "title": "Kartu",
                        "icon": Icons.card_membership,
                        "onTap": () {},
                      },
                      {
                        "title": "Kalender",
                        "icon": Icons.calendar_month,
                        "onTap": () {},
                      },
                    ];
                    return ListView.builder(
                      itemCount: buttonList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        var item = buttonList[index];
                        return ListTile(
                          minLeadingWidth: 0.0,
                          onTap: () {},
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: myBGreen,
                            ),
                            child: Icon(
                              item["icon"],
                              color: myWhite,
                              size: 24.0,
                            ),
                          ),
                          title: Text(
                            item["title"],
                            style: TextStyle(
                              color: myGrey,
                            ),
                          ),
                          trailing: Icon(
                            Icons.chevron_right,
                            size: 24.0,
                          ),
                        );
                      },
                    );
                  }),
                  ListTile(
                    minLeadingWidth: 0.0,
                    onTap: () => controller.doLogout(),
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: myRed,
                      ),
                      child: Icon(
                        Icons.logout_rounded,
                        color: myWhite,
                        size: 24.0,
                      ),
                    ),
                    title: Text(
                      "Keluar Dari Akun",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
