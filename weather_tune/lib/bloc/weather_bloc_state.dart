part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {}

final class WeatherBlocSuccess extends WeatherBlocState {
  final Weather weather;

  final List<Weather> weatherlist;

  const WeatherBlocSuccess(this.weather, this.weatherlist);

  @override
  List<Object> get props => [weather];
}

