import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String tabName; // Add this new parameter for the tab name

  const MyTab({
    super.key,
    required this.iconPath,
    required this.tabName, // Make it required
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80, // Increase height to accommodate both icon and text
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              color: Colors.grey[600],
              height: 24, // Set a fixed height for the icon
            ),
            const SizedBox(height: 4), // Add some spacing between icon and text
            Text(
              tabName,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12, // Adjust font size as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
