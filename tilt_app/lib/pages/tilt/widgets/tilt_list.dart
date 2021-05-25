import 'package:binary_music_tools/beer_calculator.dart';
import 'package:binary_music_tools/models/tilt.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TiltList extends StatelessWidget {
  final DateFormat _dateFormat = DateFormat("dd.MM.yyyy HH:mm:ss");
  final List<Tilt> tilts;

  TiltList({Key? key, required this.tilts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: tilts.length,
      itemBuilder: (context, index) {
        final tilt = tilts[index];
        return Card(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading:
                      Icon(Icons.circle, color: NameParsing.byName(tilt.color)),
                  title: Text(tilt.color),
                  subtitle: Text(
                    _dateFormat.format(tilt.lastUpdated.toLocal()),
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Starting Gravity: ${tilt.startingGravity.toStringAsFixed(2)} °Plato",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Gravity: ${tilt.specificGravity.toStringAsFixed(2)} °Plato",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ABV: ${BeerCalculator.calculateABV(
                      tilt.startingGravity,
                      tilt.specificGravity,
                    ).toStringAsFixed(2)} %",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Temperature: ${tilt.temperature.celsius.toStringAsFixed(2)} °C",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      child: Text('SET STARTING GRAVITY'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

extension NameParsing on Color {
  static const Map<String, Color> colors = {
    "black": Colors.black,
    "white": Colors.white,
    "grey": Colors.grey,
    "blue": Colors.blue,
    "green": Colors.green,
    "red": Colors.red,
    "orange": Colors.orange,
    "puple": Colors.purple,
    "pink": Colors.pink,
  };

  static Color byName(String colorName, {Color defaultColor = Colors.grey}) {
    return NameParsing.colors[colorName.toLowerCase()] ?? defaultColor;
  }
}