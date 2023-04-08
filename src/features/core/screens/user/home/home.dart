import 'dart:ui';

import 'package:auctiondemo/public/utils/constants/colors.dart';
import 'package:auctiondemo/public/utils/constants/refer_to_constants.dart';

import 'package:auctiondemo/src/models/usermodel.dart';
import 'package:auctiondemo/src/providers/user_provider.dart';
import 'package:auctiondemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controllers/drawer_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyDrawerController());
    UserProvider userprovider =
    Provider.of<UserProvider>(context, listen: false);
    UserDataModel profiledata = Provider.of<UserProvider>(context).getUserData;

    RefreshController _refreshController = RefreshController();

    void _onRefresh() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      await userprovider.refreshuser();
      _refreshController.refreshCompleted();
    }

    final authrepo = Get.put(AuthenticationRepository());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
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
              controller.toggleDrawer();
              // authrepo.logout();
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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _onRefresh,
        child: SizedBox(
          width: width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20.0,right:20.0,bottom: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text.rich(
                  TextSpan(
                    text: 'My',
                    children: [
                      TextSpan(
                        text: 'Home',
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
      ),
    );
  }
}
