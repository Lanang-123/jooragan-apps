import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:joooragan/models/CategoryModel.dart';
import 'package:joooragan/models/Category_Edu_Model.dart';
import 'package:joooragan/models/ProductModel.dart';

class JooraganService {
  final Dio _dio = Dio();
  final apiUrl = "https://api.jooragan.id/api/";

  Future<List<CategoryModel>> fetchCategory() async {
    try {
      final response = await _dio.get(apiUrl + 'category');

      if (response.statusCode == 200) {
        // Jika panggilan API berhasil, konversi respons JSON menjadi List<CategoryModel>
        final List<dynamic> jsonData = response
            .data; // Ganti 'data' dengan kunci yang sesuai di respons API Anda

        final categories = jsonData.map((json) {
          return CategoryModel.fromJson(json);
        }).toList();

        return categories;
      } else {
        // Jika panggilan API gagal, kembalikan List<CategoryModel> kosong atau tangani pesan kesalahan
        return [];
      }
    } catch (error) {
      // Tangani kesalahan jika terjadi
      print('Error: $error');
      return [];
    }
  }

  Future<List<CategoryEduModel>> fetchCategoryEdu() async {
    try {
      final response = await _dio.get(apiUrl + 'category-edu');

      if (response.statusCode == 200) {
        // Ganti 'categories' dengan kunci yang sesuai di respons API Anda
        final List<dynamic>? jsonData = response.data['data'];

        if (jsonData != null) {
          final categories = jsonData.map((json) {
            return CategoryEduModel.fromJson(json);
          }).toList();

          return categories;
        } else {
          // Kasus di mana data kategori adalah null
          return [];
        }
      } else {
        // Jika panggilan API gagal, kembalikan List<CategoryModel> kosong atau tangani pesan kesalahan
        return [];
      }
    } catch (error) {
      // Tangani kesalahan jika terjadi
      print('Error: $error');
      return [];
    }
  }


  Future<Map<String, dynamic>> fetchProduct() async {
    try {
      final response = await _dio.get(apiUrl + 'products');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData =
            Map<String, dynamic>.from(response.data);
        print(jsonData);
        return jsonData;
      } else {
        // Handle error here, e.g., throw an exception or return an empty Map.
        throw Exception('Failed to load product data');
      }
    } catch (e) {
      // Handle exceptions, e.g., network errors.
      throw Exception('Error: $e');
    }
  }


  Future<dynamic> searchProduct(String name) async {
    try {
      final url = "$apiUrl" + 'products/name/$name';
      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null) {
          print(data['data']);
          return data['data'];
        }
            
          
      } else {
        print('Gagal mengambil data dari API');
      }
    } catch (e) {
      print('error $e');
    }
  }

  Future<dynamic> productByCategory(String id) async {
    try {
      final url = "$apiUrl" + 'products/category/$id';
      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null) {
          return data;
        }
            
          
      } else {
        print('Gagal mengambil data dari API');
      }

    } catch (e) {
      print('error $e');
    }
  }

}
