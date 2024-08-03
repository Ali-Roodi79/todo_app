import 'dart:convert';
import 'package:http/http.dart' as http;

class APIOperation {
  Future<http.Response> post(String url, Map<String, dynamic> body,
      {Map<String, dynamic> headers = const {}}) {
    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
        ...headers
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> fetchAll(String url, {Map<String, dynamic> headers = const {}}) {
    return http.get(Uri.parse(url),headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
      ...headers
    },);
  }

  Future<http.Response> put(String url, Map<String, dynamic> body, {Map<String, dynamic> headers = const {}}) {
    return http.put(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
        ...headers
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> delete(String url,
      {Map<String, dynamic> headers = const {}}) {
    return http.delete(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
        ...headers
      },
    );
  }
}
