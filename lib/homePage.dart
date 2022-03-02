import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:textingapp/finctionFile.dart';

class homePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _mainPage();

}

class _mainPage extends State<homePage>{

  List<Welcome> _value;

  @override
  void initState(){
    super.initState();
  }

  Future<List<Welcome>> getData() async{
   final data = await rootBundle.loadString('assets/TestJSON.txt');
   print(data);
   final List<Welcome> value = welcomeFromJson(data.toString()) as List<Welcome>;
   return value;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity ,
          child: ElevatedButton(
            onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => _bottomFuntion()),
            child: Text(
                'choose'
            ),
          ),
          // child:FutureBuilder(builder: (context, snapshot) {
          //   var showData = json.decode(snapshot.data.toString());
          //   return ListView.builder(
          //     itemBuilder: (BuildContext context, int index) {
          //       return ListTile(
          //         title: Text(
          //             showData[1]["companyName"]
          //         ),
          //
          //       );
          //     },
          //     itemCount: 1,
          //   );
          // },
          //   future: DefaultAssetBundle.of(context).loadString('assets/TestJSON.json'),
          // )
      ),
    ));
  }

  Widget _bottomFuntion(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_sharp),
          title: Text(
              'Select account number'
          ),
          onTap: (){_bank();},
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_sharp),
          title: Text(
              'Select brand'
          ),
          onTap: (){},
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_sharp),
          title: Text(
              'Select location'
          ),
          onTap: (){},
        )
      ],
    );
  }

  Widget _bank(){
    return Container(
      height: 900,
      width: double.infinity,
      );
  }

}


