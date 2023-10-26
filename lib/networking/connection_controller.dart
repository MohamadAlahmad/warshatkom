import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:warshatkom/controller/categories_controller.dart';
import 'package:warshatkom/controller/cities_controller.dart';
import 'package:warshatkom/globals.dart';
import 'package:warshatkom/model/MainCategory.dart';
import 'package:warshatkom/model/SubCategory.dart';
import 'package:warshatkom/model/city.dart';

class ConnectionController {

  static Future<List<MainCategory>> getCategories() async {
    Uri url = Uri.parse(baseUrl + mainCategories);
    var response = await get(
      url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded ;charset=utf-8",
      },
    );

    if(response.statusCode == 200) {

      final List<dynamic> data = json.decode(response.body)['data'];

      List<MainCategory> mainCategories = data.map((categoryData) => MainCategory(
        id: categoryData['id'],
        name: categoryData['name'],
      )).toList();


      for(var x in mainCategories) {
        print('name ${x.name} - id ${x.id}');
        CategoriesController().addCategoryToList(x);
      }

      return mainCategories;

    } else {
      throw Exception('Error Code');
    }
    /*try {
      } on SocketException {
      print('::: Socket Exception :::');
    } on HttpException {
      print('::: Http Exception :::');
    } on ClientException {
      print('::: Client Exception :::');
    } catch(e) {
      print('::: Error ::: $e');
    }
    return [];*/
  }

  static Future<List<SubCategory>> getSubCategoriesById({required int nodeId}) async {
    Uri url = Uri.parse(baseUrl + subCategories + nodeId.toString());
    var response = await get(
      url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded ;charset=utf-8",
      },
    );
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body)['data'];

      if (responseData is List) {
        // If responseData is a list, map it to SubCategory objects
        List<SubCategory> subCategories = responseData.map((categoryData) => SubCategory(
          id: categoryData['id'],
          name: categoryData['name'],
          parentId: categoryData['parent_id'],
          isLeave: categoryData['is_leave'],
        )).toList();

        for (var x in subCategories) {
          print('name ${x.name} - id ${x.id} - parentId ${x.parentId}');
          CategoriesController().addSubCategoryToList(x);
        }

        return subCategories;
      } else if (responseData is Map<String, dynamic>) {
        // If responseData is an object, you can choose to return a single SubCategory or an empty list.
        SubCategory subCategory = SubCategory(
          id: responseData['id'],
          name: responseData['name'],
          parentId: responseData['parent_id'],
          isLeave: responseData['is_leave'],
        );

        CategoriesController().addSubCategoryToList(subCategory);

        return [subCategory];
      }
    }

    throw Exception('Error');
  }

  static Future<List<City>> getCities() async {
    Uri url = Uri.parse(baseUrl + cities);
    var response = await get(
      url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded ;charset=utf-8",
      },
    );
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body)['data'];

      if (responseData is List) {
        // If responseData is a list, map it to SubCategory objects
        List<City> cities = responseData.map((cityData) => City(
          id: cityData['id'],
          name: cityData['name'],
        )).toList();

        for (var x in cities) {
          print('name ${x.name} - id ${x.id}');
          CitiesController().addCity(x);
        }

        return cities;
      } else if (responseData is Map<String, dynamic>) {
        // If responseData is an object, you can choose to return a single SubCategory or an empty list.
        City city = City(
          id: responseData['id'],
          name: responseData['name'],
        );

        //CategoriesController().addSubCategoryToList(subCategory);

        return [city];
      }
    }

    throw Exception('Error');
  }


}