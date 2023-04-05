import 'package:auctiondemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboardFragment extends StatefulWidget {
  const AdminDashboardFragment({Key? key}) : super(key: key);

  @override
  State<AdminDashboardFragment> createState() => _AdminDashboardFragmentState();
}

class _AdminDashboardFragmentState extends State<AdminDashboardFragment> {
  @override
  Widget build(BuildContext context) {
    final authrepo = Get.put(AuthenticationRepository());
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authrepo.logout();
            },
          ),
        ],
        //elevation: 0,
        //centerTitle: true,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text("akb85308@gmail.com"),
              accountName: Text("Sumit Bhardwaj"),
              currentAccountPicture: CircleAvatar(
                foregroundImage: AssetImage("images/img1.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Shopping Cart"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favourite"),
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text("Labels"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Shopping Cart"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favourite"),
              onTap: () {},
            ),
          ],
        ),
      ),

      //extendBodyBehindAppBar: true,
      body: const Center(
        child: Text.rich(
          TextSpan(
            text: 'My',
            children: [
              TextSpan(
                text: 'Admin',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'App',
                style: TextStyle(fontSize: 30.0, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
