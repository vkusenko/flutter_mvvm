abstract class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<dynamic> get(String endpoint, {Map<String, String>? headers});
  Future<dynamic> post(String endpoint, {dynamic body, Map<String, String>? headers});
  Future<dynamic> put(String endpoint, {dynamic body, Map<String, String>? headers});
  Future<dynamic> delete(String endpoint, {Map<String, String>? headers});
}
