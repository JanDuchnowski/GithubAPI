import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {'Accept': 'application/vnd.github+json'},
    ),
  );
}

class ApiConstants {
  static const String baseUrl = 'https://api.github.com';
  static const String repos = '/repos';
  static const String issues = '/issues';
  static const String pulls = '/pulls';
}
