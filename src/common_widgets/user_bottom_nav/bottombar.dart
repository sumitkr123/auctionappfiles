
import 'package:auctiondemo/public/utils/constants/colors.dart';
import 'package:auctiondemo/public/utils/constants/refer_to_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../alertexit_dialog/alertexit.dart';

import '../../features/core/user/screens/home/home.dart';
import '../../features/core/user/screens/explore/explore.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key,}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late PageController pageController;

  bool isShown = true;

  int currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onpagechanged(int page) {
    setState(() {
      currentTab = page;
    });
  }

  final List<Widget> screens = const <Widget>[
    HomeScreen(),
    ExploreScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        if (currentTab == 0) {
          showDialog(
            context: context,
            builder: (dgcontext) {
              return CustomAlertDialogExit(
                context: dgcontext,
              );
            },
          );
        } else {
          navigationTapped(0);
        }
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
              children: [
                PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: onpagechanged,
                  children: screens,
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(
                          color: tPrimaryColor,
                          spreadRadius: 1.2,
                          blurRadius: 1,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        useLegacyColorScheme: false,
                        selectedFontSize: 0.0,
                        unselectedFontSize: 0.0,
                        elevation: 0,
                        unselectedIconTheme: const IconThemeData(
                          color: tSecondaryColor,
                        ),
                        items: <BottomNavigationBarItem>[
                          const BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home_outlined,
                            ),
                            label: 'Home',
                            tooltip: 'Home',
                          ),
                          const BottomNavigationBarItem(
                            icon: Icon(
                              Icons.explore_outlined,
                            ),
                            label: 'Explore',
                            tooltip: 'Explore',
                          ),
                          BottomNavigationBarItem(
                            icon: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: tPrimaryColor,
                                  shape: BoxShape.circle,
                                ),
                                // padding: const EdgeInsets.all(14),
                                child: const Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                            tooltip: 'Add product',
                            label: '',
                          ),
                          const BottomNavigationBarItem(
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                            ),
                            label: 'My bag',
                            tooltip: 'My bag',
                          ),
                          const BottomNavigationBarItem(
                            icon: Icon(
                              Icons.menu_outlined,
                            ),
                            label: 'Menu',
                            tooltip: 'Menu',
                          ),
                        ],
                        onTap: (value) {
                          navigationTapped(value);
                        },
                        currentIndex: currentTab,
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
}

