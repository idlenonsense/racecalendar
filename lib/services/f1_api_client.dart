import 'package:dio/dio.dart';
import '../models/race_model.dart' as models;

class F1ApiClient {
  late final Dio _dio;
  final String baseUrl = 'https://f1api.dev/api';

  F1ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }

  Future<List<models.RaceModel>> fetchCurrentSeasonRaces() async {
    try {
      final response = await _dio.get('/2026');
      if (response.statusCode == 200) {
        final apiResponse = models.ApiResponse.fromJson(response.data);
        return apiResponse.races;
      } else {
        throw Exception('Failed to load races: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('URL: ${e.requestOptions.uri}');
      if (e.response != null) {
        print('Response status: ${e.response?.statusCode}');
        print('Response data: ${e.response?.data}');
      } else {
        print('No response (network error or timeout)');
      }
      rethrow;
    }
  }

  Future<models.RaceModel> fetchRaceDetails(String raceId) async {
    try {
      final response = await _dio.get('/2026');
      if (response.statusCode == 200) {
        final apiResponse = models.ApiResponse.fromJson(response.data);
        final races = apiResponse.races.where((r) => r.raceId == raceId).first;
        return races;
      } else {
        throw Exception('Гонка с ID $raceId не найдена');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      if (e.response != null) {
        print('Response status: ${e.response?.statusCode}');
      } else {
        print('No response (network error or timeout)');
      }
      rethrow;
    }
  }
}