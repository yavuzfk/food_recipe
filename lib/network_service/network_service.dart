import 'dart:io';

import '../api/model/food_recipe.dart';

import 'package:dio/dio.dart';

abstract class INetworkService {
  Future<List<FoodRecipe>?> getFoodRecipes();
}

class NetworkService extends INetworkService {
  final Dio _dio;
  NetworkService() : _dio = Dio();
  final String _apiUrl =
      "http://192.168.1.29:5500/lib/api/model/food_recipe_list.json";
  @override
  Future<List<FoodRecipe>?> getFoodRecipes() async {
    try {
      final response = await _dio.get(_apiUrl);
      if (response.statusCode == HttpStatus.ok) {
        return (response.data as List)
            .map((e) => FoodRecipe.fromJson(e))
            .toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
