import 'package:flutter/material.dart';

class SmoothieTile extends StatefulWidget {
  final String smoothieFlavor;
  final String smoothiePrice;
  final dynamic smoothieColor;
  final String imageName;
  final String smoothieStore;
  final VoidCallback? onAddToCart;

  const SmoothieTile({
    super.key,
    required this.smoothieFlavor,
    required this.smoothieStore,
    required this.smoothiePrice,
    required this.smoothieColor,
    required this.imageName,
    this.onAddToCart,
  });

  @override
  State<SmoothieTile> createState() => _SmoothieTileState();
}

class _SmoothieTileState extends State<SmoothieTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: widget.smoothieColor[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.smoothieColor[100],
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
                    '\$${widget.smoothiePrice}',
                    style: TextStyle(
                      color: widget.smoothieColor[800],
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
              widget.smoothieFlavor,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.smoothieStore,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: widget.smoothieColor[800],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: widget.smoothieColor[800],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (widget.onAddToCart != null) {
                      widget.onAddToCart!();
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.smoothieFlavor} added to cart!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: widget.smoothieColor[800],
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