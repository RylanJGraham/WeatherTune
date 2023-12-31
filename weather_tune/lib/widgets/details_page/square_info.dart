import 'package:flutter/material.dart';

class SquareInfoDisplay extends StatefulWidget {
  const SquareInfoDisplay({
    super.key,
    required this.icon,
    required this.infoTitle,
    required this.data,
    required this.additionalInfoTitle,
    required this.additionalData,
  });

  final IconData icon;
  final String infoTitle;
  final String? data;
  final String additionalInfoTitle;
  final String? additionalData;

  @override
  State<SquareInfoDisplay> createState() => _SquareInfoDisplayState();
}

class _SquareInfoDisplayState extends State<SquareInfoDisplay> {
  List<Color> gradientSquareColors = [
    Colors.transparent,
    const Color.fromARGB(93, 63, 81, 181),
    const Color.fromARGB(148, 104, 58, 183),
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientSquareColors,
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
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Colors.white60,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(
                widget.infoTitle,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            widget.data!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            widget.additionalInfoTitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            widget.additionalData!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
