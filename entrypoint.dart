import 'package:auctiondemo/src/features/core/admin/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'src/common_widgets/loading_dialog/loadingdialog.dart';
import 'src/features/core/user/screens/dashboard.dart';
import 'src/providers/user_provider.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    UserProvider _userprovider =
        Provider.of<UserProvider>(context, listen: false);

    return FutureBuilder(
      future: _userprovider.refreshuser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Loader());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return _userprovider.getUserData.role == 'admin' ? const AdminDashboardFragment() : const DashboardFragment();
        } else {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
      },
    );
  }
}
