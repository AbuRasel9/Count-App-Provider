import 'dart:async';

import 'package:count_provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //auto increment value per second use provider
    final countProvider=Provider.of<CountProvider>(context,listen: false);

    Timer.periodic(Duration(seconds: 1),(timer){
      countProvider.setCount();

    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Home Screen"),
      ),
      body:Consumer<CountProvider>(builder: (BuildContext context, value, Widget? child,) {
        return Center(
          child: Text(value.count.toString(),style: TextStyle(fontSize: 50),),
        );
      },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
