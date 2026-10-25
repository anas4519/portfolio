import 'package:awesome_portfolio/screen/miniProjects/project_display/project_builder.dart';
import 'package:flutter/material.dart';

class Commute extends StatelessWidget {
  const Commute({super.key});

  @override
  Widget build(BuildContext context) {
    return ProjectBuilder(
      screenshots: const [],
      bgImage: 'assets/icons/commute.png',
      name: 'Commute',
      tagLine: 'Compare every way to get there, stops included',
      psLink: '',
      ghLink: 'https://github.com/anas4519/commute',
      details:
          "Commute is a personal Flutter app that compares travel options for a trip side by side: car, bike, auto and e-rickshaw, with live times and distances from the Google Routes API.\n\n"
          "Instead of only showing the fastest route, it lets you add stops along the way and computes time and distance for that exact route. One tap hands off to Rapido or Uber with the pickup and drop already filled in.\n\n"
          "The backend runs on free serverless hosting, keeping the API key off the device.",
      techStack: const [
        {'name': 'Flutter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
        {'name': 'Routes API', 'icon': Icons.map, 'color': Colors.green},
        {'name': 'Serverless', 'icon': Icons.cloud, 'color': Colors.indigo},
        {'name': 'Deep Links', 'icon': Icons.link, 'color': Colors.orange},
      ],
      features: const [
        {'icon': Icons.compare_arrows, 'title': 'Compare Modes', 'desc': 'Car, bike, auto, e-rick'},
        {'icon': Icons.add_location_alt, 'title': 'Stops', 'desc': 'Time for your exact route'},
        {'icon': Icons.timer, 'title': 'Live Times', 'desc': 'Traffic-aware ETAs'},
        {'icon': Icons.open_in_new, 'title': 'Book Fast', 'desc': 'Rapido and Uber handoff'},
      ],
      points: const [
        'Built with Flutter for Android',
        'Live, traffic-aware times and distances via Google Routes API',
        'Add intermediate stops and get time and distance for that exact route',
        'E-rickshaw estimate derived from car and bike times',
        'Deep links into Rapido and Uber with pickup and drop prefilled',
        'Free serverless backend so the API key never ships in the app',
        'Unit tested route and stop logic',
      ],
    );
  }
}
