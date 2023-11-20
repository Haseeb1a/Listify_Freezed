import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todofreezed/models/tudo_model.dart';

class ApiService {
  // get-----------------------
  static Future<Todo> fetchDataFromAPI() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final Dio dio = Dio();
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        print(response.data);
        return Todo.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

// Post-------------------------------------------
  Future<void> submitdata(context, String title, String description) async {
    try {
      final body = {
        "title": title,
        "description": description,
        "is_completed": false,
      };
      const url = 'https://api.nstack.in/v1/todos';
      final uri = Uri.parse(url);
      final responce = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      print(responce.statusCode);
      print(responce.body);

      if (responce.statusCode == 201) {
        print("Creation Success");
        fetchDataFromAPI();
      } else {
        print("Creation Error");
        print(responce.body);
      }
    } catch (e) {
      print("An error occurred: $e");
      // Handle the error as needed, for example, show an error message to the user.
    }
  }

  //delete ---------------------------------------------------
  Future<void> deleteItem(BuildContext ctx, String itemId) async {
    try {
      final url = Uri.parse('https://api.nstack.in/v1/todos/$itemId');

      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('Item deleted successfully');
      } else {
        print('Error deleting item: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('An error occurred: $e');
      // Handle the error as needed, for example, show an error message to the user.
    }
  }

//  put-------------------------
  Future<void> updateItem(
      context, String itemId, String title, String description) async {
    try {
      final url = Uri.parse('https://api.nstack.in/v1/todos/$itemId');

      final Map<String, String> data = {
        "title": title,
        "description": description,
      };

      final response = await http.put(
        url,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('Item updated successfully');
      } else {
        print('Error updating item: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('An error occurred: $e');
      // Handle the error as needed, for example, show an error message to the user.
    }
  }
}
