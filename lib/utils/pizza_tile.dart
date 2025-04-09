import 'package:flutter/material.dart';

class PizzaTile extends StatefulWidget {
  final String pizzaFlavor;
  final String pizzaPrice;
  final dynamic pizzaColor;
  final String imageName;
  final String pizzaStore;
  final VoidCallback? onAddToCart;

  const PizzaTile({
    super.key,
    required this.pizzaFlavor,
    required this.pizzaStore,
    required this.pizzaPrice,
    required this.pizzaColor,
    required this.imageName,
    this.onAddToCart,
  });

  @override
  State<PizzaTile> createState() => _PizzaTileState();
}

class _PizzaTileState extends State<PizzaTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: widget.pizzaColor[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.pizzaColor[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 9,
                    horizontal: 18,
                  ),
                  child: Text(
                    '\$${widget.pizzaPrice}',
                    style: TextStyle(
                      color: widget.pizzaColor[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 0,
              ),
              child: Image.asset(widget.imageName),
            ),
            Text(
              widget.pizzaFlavor,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.pizzaStore,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: widget.pizzaColor[800],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: widget.pizzaColor[800],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (widget.onAddToCart != null) {
                      widget.onAddToCart!();
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.pizzaFlavor} added to cart!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: widget.pizzaColor[800],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
