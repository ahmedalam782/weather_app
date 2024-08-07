import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourDesignWidget extends StatelessWidget {
  const HourDesignWidget({super.key, required this.hours});

  final dynamic hours;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(hours['time']);
    var format = DateFormat.Hm().format(dateTime);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  "Hour:",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  format,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 25,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "temp :",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${(hours['temp_c']).round()}",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 25,
                      ),
                ),
              ],
            ),
            Image.network(
              "https:${hours['condition']['icon']}",
            ),
            Text(
              hours['condition']['text'],
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
