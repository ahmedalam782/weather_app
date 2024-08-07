import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 25,
                  ),
            ),
            Text(
              'searching now 🔍',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 25,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
