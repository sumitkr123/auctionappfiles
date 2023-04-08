
import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'public/utils/constants/colors.dart';
import 'src/common_widgets/loading_dialog/loadingdialog.dart';
import 'src/common_widgets/user_bottom_nav/bottombar.dart';
import 'src/features/core/controllers/drawer_controller.dart';

import 'src/features/core/screens/admin/dashboard.dart';
import 'src/features/core/screens/user/home/widgets/drawer_menu.dart';
import 'src/providers/user_provider.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyDrawerController());
    UserProvider _userprovider =
        Provider.of<UserProvider>(context, listen: false);

    return FutureBuilder(
      future: _userprovider.refreshuser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Loader());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return _userprovider.getUserData.role == 'admin'
              ? const AdminDashboardFragment()
              : GetBuilder<MyDrawerController>(
            builder: (_) => ZoomDrawer(
              controller: _.zoomDrawerController,
              borderRadius: 30.0,
              showShadow: true,
              angle: 0.0,
              style: DrawerStyle.defaultStyle,
              menuScreen: const CustomDrawer(),
              menuBackgroundColor: tWhiteColor,
              drawerShadowsBackgroundColor: tPrimaryColor,
              slideWidth: MediaQuery.of(context).size.width * 0.85,
              mainScreen: const BottomBar(),
              mainScreenTapClose: true,
            ),
          );
        } else {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
      },
    );
  }
}
