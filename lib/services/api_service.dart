import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_api/model/bitcoin_entity.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.coincap.io/v2/'));

  Future<List<BitcoinEntity>> fetchData() async {
    try {
      final response = await _dio.get('rates');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => BitcoinEntity.fromJson(json)).toList();
      }
      // TODO(develop): Добавить обработку ошибок !
      else {
        throw Exception('Ошибка загрузки данных');
      }
    } catch (e) {
      debugPrint('Ошибка: $e');
      throw Exception('Ошибка запроса: $e');
    }
  }
}
