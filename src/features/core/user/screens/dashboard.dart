import 'package:auctiondemo/public/utils/constants/colors.dart';
import 'package:auctiondemo/public/utils/constants/refer_to_constants.dart';
import 'package:auctiondemo/src/features/core/admin/screens/profile.dart';
import 'package:auctiondemo/src/models/usermodel.dart';
import 'package:auctiondemo/src/providers/user_provider.dart';
import 'package:auctiondemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({Key? key}) : super(key: key);

  @override
  State<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  UserDataModel? profiledata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final profile = Provider.of<UserProvider>(context, listen: false);
    profiledata = profile.getUserData;
  }

  @override
  Widget build(BuildContext context) {
    final authrepo = Get.put(AuthenticationRepository());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 20.0,
          ),
          child: Container(
            width: width,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
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
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
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
                          const Icon(Icons.key_outlined),
                          const Text('20'),
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
                    const Spacer(),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.notifications_none_outlined),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.favorite_outline),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height *0.75,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
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
                              style: TextStyle(fontSize: 30.0, color: Colors.blue),
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
        ),
      ),
    );
  }
}
