import 'package:flutter/material.dart';

class AirConcentration extends StatefulWidget {
  const AirConcentration({
    super.key,
    required this.cloudiness,
    required this.humidity,
    required this.pressure,
  });

  /// Cloudiness in Okta scale
  final int cloudiness;

  /// Humidity in percentage
  final int humidity;

  /// Pressure in Pascal(s)
  final int pressure;

  @override
  State<AirConcentration> createState() => _AirConcentrationState();
}

class _AirConcentrationState extends State<AirConcentration> {
  List<Color> gradientColors = [
    Colors.transparent,
    const Color.fromARGB(93, 63, 81, 181),
    const Color.fromARGB(148, 104, 58, 183),
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 120,
      height: 130,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: AlignmentDirectional.bottomStart,
          end: Alignment.topRight,
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 247, 196, 213),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.waves_outlined,
                color: Colors.white70,
              ),
              SizedBox(width: 5),
              Text(
                "AIR CONCENTRATION",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Cloudiness: ",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                " ${widget.cloudiness} (Okla Scale)",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Humidity: ",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                " ${widget.humidity}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Pressure: ",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                " ${widget.pressure} Pa",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
