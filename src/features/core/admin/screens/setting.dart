import 'package:flutter/material.dart';

class SettingFragment extends StatefulWidget {
  const SettingFragment({Key? key}) : super(key: key);

  @override
  State<SettingFragment> createState() => _SettingFragmentState();
}

class _SettingFragmentState extends State<SettingFragment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title: Text('Setting'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        //elevation: 0,
        //centerTitle: true,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),

      //extendBodyBehindAppBar: true,
      body: Center(
        child: Text.rich(
          TextSpan(
            text: 'My',
            children: [
              TextSpan(
                  text: 'Setting',
                  style:
                  TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'App',
                  style: TextStyle(fontSize: 30.0, color: Colors.blue)),
            ],
          ),
        ),
      ),


    );
  }
}
