import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../controller/navbar_controller.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({Key? key}) : super(key: key);

  Widget build(context, NavbarController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 3,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            HomeView(),
            AddProductView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          iconSize: 25,
          currentIndex: controller.selectedIndex,
          selectedItemColor: myGreen,
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            controller.onTap(index);
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Add",
              icon: Icon(
                Icons.add,
              ),
            ),
            BottomNavigationBarItem(
              label: "My Profil",
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<NavbarView> createState() => NavbarController();
}
