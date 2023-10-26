import 'package:get/get.dart';
import 'package:warshatkom/model/city.dart';

class CitiesController extends GetxController {
  List<City> cities = [];
  List<String> citiesNames = [];

  addCity(City city) {
    cities.add(city);
    citiesNames.add(city.name);
    update();
  }

  getCities() {
    return cities;
  }
  getCitiesNames() {
    return citiesNames;
  }
}