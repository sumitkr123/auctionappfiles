import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../../../../../../public/utils/constants/refer_to_constants.dart';
import '../../../../../../models/usermodel.dart';
import '../../../../../../providers/user_provider.dart';
import '../../../../controllers/drawer_controller.dart';

class CustomDrawer extends GetView<MyDrawerController> {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDataModel userData = Provider.of<UserProvider>(context).getUserData;
    var divider = const Divider(
      color: tTransparentColor,
    );
    return Container(
      width: double.maxFinite,
      color: tWhiteColor,
      padding: const EdgeInsets.all(tHomePadding),
      child: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Get.to(const ProfileScreen());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfilePicture(
                              name: userData.username,
                              radius: 60.0,
                              fontsize: 90,
                              count: 1,
                              random: true,
                              img: userData.profilepicurl,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              userData.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    CloseButton(
                      color: tSecondaryColor,
                      onPressed: () {
                        controller.toggleDrawer();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              MyTextButton(
                onPressed: () {} ,
                icon: Icons.person,
                label: 'My Profile',
                fontsize: 30.0,
                textcolor: tGreyColor,
              ),
              divider,
              MyTextButton(
                icon: Icons.games_rounded,
                label: 'Play Kuizer?',
                onPressed: (){

                },
                fontsize: 30.0,
                textcolor: tGreyColor,
              ),
              divider,
              MyTextButton(
                onPressed: () {
                  // Get.to(const AllCreatedKuizer());
                },
                icon: Icons.qr_code_rounded,
                label: 'Kuizer? created',
                fontsize: 30.0,
                textcolor: tGreyColor,
              ),
              // divider,
              // MyTextButton(
              //   icon: Icons.gamepad_outlined,
              //   label: 'Kuizer? played',
              //   onPressed: () => controller.downloadSourceCode(),
              //   fontsize: 30.0,
              //   textcolor: tGreyColor,
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: MyTextButton(
              icon: Icons.logout_outlined,
              label: 'Sign out',
              onPressed: () {
                controller.signOut();
              },
              fontsize: 30.0,
              textcolor: tGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.icon,
    required this.label,
    this.fontsize,
    required this.textcolor,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final double? fontsize;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: fontsize,
        color: textcolor,
      ),
      label: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(color: textcolor),
        ),
      ),
      style: TextButton.styleFrom(
        primary: tTransparentColor,
      ),
    );
  }
}
