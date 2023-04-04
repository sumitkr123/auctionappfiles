import 'dart:ui';

import 'package:auctiondemo/public/utils/constants/colors.dart';
import 'package:auctiondemo/public/utils/constants/refer_to_constants.dart';
import 'package:auctiondemo/src/features/core/admin/screens/profile.dart';
import 'package:auctiondemo/src/models/usermodel.dart';
import 'package:auctiondemo/src/providers/user_provider.dart';
import 'package:auctiondemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({Key? key}) : super(key: key);

  @override
  State<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  UserDataModel? profiledata;
  final ScrollController _controller = ScrollController();
  bool isShown = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final profile = Provider.of<UserProvider>(context, listen: false);
    profiledata = profile.getUserData;
    _controller.addListener(listen);
  }

  void listen() {
    final direction = _controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isShown) {
      setState(() {
        isShown = true;
      });
    }
  }

  void hide() {
    if (isShown) {
      setState(() {
        isShown = false;
      });
    }
  }

  int sid = 0;

  void onItemTapped(int index) {
    setState(() {
      sid = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authrepo = Get.put(AuthenticationRepository());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: tTransparentColor,
          elevation: 0,
          toolbarHeight: height * 0.1,
          leadingWidth: width * 0.2,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: GestureDetector(
              onTap: () {
                authrepo.logout();
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      profiledata!.profilepicurl,
                    ),
                  ),
                  shape: BoxShape.circle,
                ),
                width: width * 0.2,
                height: height * 0.1,
              ),
            ),
          ),
          title: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(29, 190, 190, 192),
              borderRadius: BorderRadius.circular(50.0),
            ),
            width: width * 0.3,
            height: height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.key_outlined,
                  color: tSecondaryColor,
                ),
                const Text(
                  '20',
                  style: TextStyle(color: tSecondaryColor),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: tPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: tPrimaryColor,
                        border: Border.all(
                          color: tWhiteColor,
                          width: 1.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: tWhiteColor,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_none_outlined,
                color: tSecondaryColor,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.favorite_outline,
                  color: tSecondaryColor,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              width: width,
              child: SingleChildScrollView(
                controller: _controller,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'My',
                        children: [
                          TextSpan(
                            text: 'User',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'App',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: isShown ? 10 : 0,
              right: isShown ? 10 : 0,
              bottom: isShown ? 20 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 50),
                opacity: isShown ? 1 : 0,
                child: Container(
                  decoration: BoxDecoration(
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
                      onTap: onItemTapped,
                      currentIndex: sid,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
