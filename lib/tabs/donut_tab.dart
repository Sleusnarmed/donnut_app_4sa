import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  const DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // El que roba cosas en la prepa 1 (ESO ENTENDÍ)
      // organizador
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      padding: const EdgeInsets.all(12),
      // Elemento construido
      itemBuilder: (BuildContext context, int index) {
        return;
      },
    );
  }
}
