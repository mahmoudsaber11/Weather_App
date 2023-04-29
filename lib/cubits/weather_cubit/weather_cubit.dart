import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/pages/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      WeatherModel? weatherModel =
          await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccesState(weatherModel: weatherModel!));
    } on Exception {
      emit(WeatherErrorState());
    }
  }
}
