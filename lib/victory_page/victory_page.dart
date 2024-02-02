import 'package:flutter/material.dart';

class VictoryPage extends StatefulWidget {
  const VictoryPage({super.key});

  @override
  State<VictoryPage> createState() => _VictoryPageState();
}

class _VictoryPageState extends State<VictoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arunav"),
        actions: [
          InkWell(
            
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [],),
    );
  }
}