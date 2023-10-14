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

  Future<List<Product>> fetchProduct() async {
    try {
      final response = await _dio.get(apiUrl + 'products');

      if (response.statusCode == 200) {
        // Ganti 'categories' dengan kunci yang sesuai di respons API Anda
        final List<dynamic>? jsonData = response.data['data'];

        if (jsonData != null) {
          final products = jsonData.map((json) {
            return Product.fromJson(json);
          }).toList();

          return products;
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
}
