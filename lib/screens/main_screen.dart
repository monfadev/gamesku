import 'package:flutter/material.dart';
import 'package:gamesku/core/resources/color.dart';
import 'package:gamesku/core/resources/style.dart';
import 'package:gamesku/screens/components/list_popular.dart';

import 'components/custom_tabbar.dart';
import 'components/list_top_account.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                bottom: false,
                child: CustomTabBar(
                  titles: const ["COMPUTER", "MOBILE PHONE", "CONSOLE", "PLAYSTATION"],
                  selectedIndex: 0,
                  onTap: (index) {},
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset("assets/slider.png", fit: BoxFit.cover),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 5,
                        width: 100,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular PC Game", style: tsWhite.copyWith(fontWeight: fwSemiBold, fontSize: 16)),
                          Text("See All", style: tsGrey.copyWith(fontWeight: fwMedium, fontSize: 14)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: ListView(
                        padding: const EdgeInsets.only(left: 24),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: const [
                          ListPopular(imageUrl: "assets/valorant.png"),
                          SizedBox(width: 20),
                          ListPopular(imageUrl: "assets/apex.png"),
                          SizedBox(width: 20),
                          ListPopular(imageUrl: "assets/rfonline.png"),
                          SizedBox(width: 20),
                          ListPopular(imageUrl: "assets/dota2.png"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Top Rated Account", style: tsWhite.copyWith(fontWeight: fwSemiBold, fontSize: 16)),
                          Text("See All", style: tsGrey.copyWith(fontWeight: fwMedium, fontSize: 14)),
                        ],
                      ),
                    ),
                    const ListTopAccount(imageUrl: "assets/top_rfonline.png", title: "RF Online, Return Server", category: "PC GAME", i: 4),
                    const ListTopAccount(imageUrl: "assets/top_valorant.png", title: "Riot Games, Valorant", category: "PC GAME", i: 3),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
          createBottomNavBar(),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            top: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 60,
                width: 60,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(backgroundColor: const Color(0xff252525), shape: const StadiumBorder()),
                  child: const Icon(Icons.check_outlined, color: primaryColor, size: 40),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createBottomNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BottomNavBarClipper(),
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: const Color(0xff252525),
          fixedColor: whiteColor,
          unselectedItemColor: greyColor,
          onTap: (index) {},
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: "Saved"),
            BottomNavigationBarItem(icon: SizedBox.shrink(), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.sell_outlined), label: "Sell"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2 - 35, 0);
    path.quadraticBezierTo(size.width / 2 - 35, 35, size.width / 2, 35);
    path.quadraticBezierTo(size.width / 2 + 35, 35, size.width / 2 + 35, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
