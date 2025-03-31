import 'package:donnut_app_4sa/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  // list of donuts

  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    [
      "Ice Cream",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png",
      "Dunkin Donuts"
    ],
    [
      "Strawberry",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png",
      "Krispy Kreme"
    ],
    [
      "Grape Ape",
      "84",
      Colors.purple,
      "lib/images/grape_donut.png",
      "Relleno Donuts"
    ],
    [
      "Choco",
      "95",
      Colors.brown,
      "lib/images/chocolate_donut.png",
      "Sheeesh Donuts"
    ],
  ];
  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // El que roba cosas en la prepa 1 (ESO ENTENDÍ)
      // organizador
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1/1.5,
      ),
      itemCount: 4,
      padding: const EdgeInsets.all(12),
      // Elemento construido
      itemBuilder: (BuildContext context, int index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
          donutStore: donutsOnSale[index][4],
        );
      },
    );
  }
}
