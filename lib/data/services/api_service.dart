import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "http://localhost:9000/api";

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final uri = Uri.parse('$baseUrl/$endpoint');
    final headers = {"Content-Type": "application/json"};
    return await http.post(uri, headers: headers, body: json.encode(body));
  }
}
