import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provder/model.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Consumer<Model>(builder: (context, value, child) {
            return Text(value.count.toString());
          })),
          Center(child: Consumer<Model>(builder: (context, value, child) {
            print('sunil');
            return Text(DateTime.now().hour.toString() +
                ":" +
                DateTime.now().minute.toString() +
                ":" +
                DateTime.now().second.toString());
          }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
