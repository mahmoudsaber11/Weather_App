import 'package:weather_app/pages/model/weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccesState extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccesState({required this.weatherModel});
}

class WeatherErrorState extends WeatherState {}
