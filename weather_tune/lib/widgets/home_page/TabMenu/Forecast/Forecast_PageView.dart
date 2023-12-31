import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({super.key});

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('images/weather_icons/1.png');
      case >= 300 && < 400:
        return Image.asset('images/weather_icons/2.png');
      case >= 500 && < 600:
        return Image.asset('images/weather_icons/3.png');
      case >= 600 && < 700:
        return Image.asset('images/weather_icons/4.png');
      case >= 700 && < 800:
        return Image.asset('images/weather_icons/5.png');
      case == 800:
        return Image.asset('images/weather_icons/6.png');
      case > 800 && <= 804:
        return Image.asset('images/weather_icons/7.png');
      default:
        return Image.asset('images/weather_icons/7.png');
    }
  }

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  int unit = 1;
  String userID = "";

  @override
  void initState() {
    super.initState();
    _getUserID();
    _getUnit();
  }

  Future<void> _getUserID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      userID = user.uid;
    }
  }

  Future<void> _getUnit() async {
    try {
      DocumentSnapshot user = await FirebaseFirestore.instance
          .collection('UserInfo')
          .doc(userID)
          .get();
      var userData = user.data() as Map<String, dynamic>;
      setState(() {
        unit = userData['chosenUnit'];
      });
    } catch (e) {
      print('Error finding unit: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.weatherlist
                  .length, // Change this number to the desired count
              itemBuilder: (BuildContext context, int index) {
                bool isFirstElement = index == 0;
                return Container(
                  width: 80,
                  margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                  decoration: BoxDecoration(
                    color: isFirstElement
                        ? const Color.fromARGB(200, 149, 117, 205)
                        : const Color.fromARGB(200, 49, 27, 146),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.pink.shade50,
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                        child: Text(
                          DateFormat('EE, d/M')
                              .add_jm()
                              .format(state.weatherlist[index].date!),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: widget.getWeatherIcon(
                            state.weatherlist[index].weatherConditionCode!),
                      ),
                      Text(
                        unit == 1
                            ? "${state.weatherlist[index].temperature!.celsius!.round()}ºC"
                            : unit == 2
                                ? "${state.weatherlist[index].temperature!.kelvin!.round()}K"
                                : "${state.weatherlist[index].temperature!.fahrenheit!.round()}ºF",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
