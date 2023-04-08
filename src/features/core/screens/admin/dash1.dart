import 'package:flutter/material.dart';
import 'add.dart';
import 'dashboard.dart';
import 'like.dart';
import 'setting.dart';
import 'shop.dart';

class Dash1 extends StatefulWidget {
  Dash1({Key? key}) : super(key: key);

  @override
  State<Dash1> createState() => _Dash1State();
}

class _Dash1State extends State<Dash1> {
  int sid = 0;

  final widgetOptions = [
    new AdminDashboardFragment(),
    new ShopFragment(),
    new AddFragment(),
    new LikeFragment(),
    new SettingFragment(),
  ];

  void onItemTapped(int index) {
    setState(() {
      sid = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,

      body: Center(
        child: widgetOptions.elementAt(sid),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.green,
                spreadRadius: 1.5,
                blurRadius: 1,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: BottomNavigationBar(
              //selectedLabelStyle: TextStyle(fontSize: 20),
              //unselectedLabelStyle: TextStyle(fontSize: 15),
              selectedFontSize: 18,
              unselectedFontSize: 14,

              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,

              showUnselectedLabels: true,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Shop",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.yellow,
                      child: Icon(Icons.add),
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Like",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Setting",
                ),
              ],
              onTap: onItemTapped,
              currentIndex: sid,
            ),
          ),
        ),
      ),
    );
  }
}
