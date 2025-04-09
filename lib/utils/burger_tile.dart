import 'package:flutter/material.dart';

class BurgerTile extends StatefulWidget {
  final String burgerFlavor;
  final String burgerPrice;
  final dynamic burgerColor;
  final String imageName;
  final String burgerStore;
  final VoidCallback? onAddToCart;

  const BurgerTile({
    super.key,
    required this.burgerFlavor,
    required this.burgerStore,
    required this.burgerPrice,
    required this.burgerColor,
    required this.imageName,
    this.onAddToCart,
  });

  @override
  State<BurgerTile> createState() => _BurgerTileState();
}

class _BurgerTileState extends State<BurgerTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: widget.burgerColor[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.burgerColor[100],
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
                    '\$${widget.burgerPrice}',
                    style: TextStyle(
                      color: widget.burgerColor[800],
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
              widget.burgerFlavor,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.burgerStore,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: widget.burgerColor[800],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: widget.burgerColor[800],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (widget.onAddToCart != null) {
                      widget.onAddToCart!();
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.burgerFlavor} added to cart!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: widget.burgerColor[800],
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