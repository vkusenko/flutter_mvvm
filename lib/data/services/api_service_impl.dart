import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class ApiServiceImpl implements ApiService {
  @override
  final String baseUrl;

  ApiServiceImpl(this.baseUrl);

  Future<Map<String, String>> _getHeaders({Map<String, String>? additionalHeaders}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }
    // Add authorization token if available, e.g., from a local service
    // String? token = await _localDataService.getToken();
    // if (token != null) {
    //   headers['Authorization'] = 'Bearer $token';
    // }
    return headers;
  }

  Uri _buildUri(String endpoint, {Map<String, dynamic>? queryParameters}) {
    final uri = Uri.parse('$baseUrl/$endpoint');
    if (queryParameters != null) {
      return uri.replace(queryParameters: queryParameters);
    }
    return uri;
  }

  @override
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final uri = _buildUri(endpoint);
    final effectiveHeaders = await _getHeaders(additionalHeaders: headers);
    final response = await http.get(uri, headers: effectiveHeaders);
    return _handleResponse(response);
  }

  @override
  Future<dynamic> post(String endpoint, {dynamic body, Map<String, String>? headers}) async {
    final uri = _buildUri(endpoint);
    final effectiveHeaders = await _getHeaders(additionalHeaders: headers);
    final response = await http.post(uri, headers: effectiveHeaders, body: jsonEncode(body));
    return _handleResponse(response);
  }

  @override
  Future<dynamic> put(String endpoint, {dynamic body, Map<String, String>? headers}) async {
    final uri = _buildUri(endpoint);
    final effectiveHeaders = await _getHeaders(additionalHeaders: headers);
    final response = await http.put(uri, headers: effectiveHeaders, body: jsonEncode(body));
    return _handleResponse(response);
  }

  @override
  Future<dynamic> delete(String endpoint, {Map<String, String>? headers}) async {
    final uri = _buildUri(endpoint);
    final effectiveHeaders = await _getHeaders(additionalHeaders: headers);
    final response = await http.delete(uri, headers: effectiveHeaders);
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    final dynamic body = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    } else {
      // Consider creating custom exception classes for different error types
      throw ApiException(
        statusCode: response.statusCode,
        message: body['message'] ?? 'API Error occurred',
        details: body.toString(),
      );
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;
  final String? details;

  ApiException({required this.statusCode, required this.message, this.details});

  @override
  String toString() {
    return 'ApiException: $statusCode - $message ${details != null ? "- Details: $details" : ""}';
  }
}
