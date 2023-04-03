import 'package:flutter/material.dart';

class AddFragment extends StatefulWidget {
  const AddFragment({Key? key}) : super(key: key);

  @override
  State<AddFragment> createState() => _AddFragmentState();
}

class _AddFragmentState extends State<AddFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title: Text('Add'),
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
                  text: 'Add',
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
