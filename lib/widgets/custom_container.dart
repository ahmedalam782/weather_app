import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.title, required this.degree});

  final String title;
  final String degree;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
            ),
            Text(
              degree,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 25,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
