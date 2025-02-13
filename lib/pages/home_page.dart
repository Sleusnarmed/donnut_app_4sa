import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.purple,
            // left icon
            leading: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Icon(Icons.person),
              ),
            ]),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text("I want to ",
                    style: TextStyle(
                      fontSize: 32,
                    )),
                Text(
                  "Eat",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
