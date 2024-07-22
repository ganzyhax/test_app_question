import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<dynamic> get() async {
    try {
      var response = await http.get(Uri.parse(
          'https://getquestionnairesendpoint-nfhw57yfsq-uc.a.run.app/'));
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        return jsonDecode(response.body);
      } else {
        // If the server returns an error response, throw an exception.
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Catching any exception that occurs during the HTTP request
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<dynamic> getById(String id) async {
    try {
      var response = await http.get(Uri.parse(
          'https://getquestionnairebyid-nfhw57yfsq-uc.a.run.app/?id=' + id));
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        return jsonDecode(response.body);
      } else {
        // If the server returns an error response, throw an exception.
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Catching any exception that occurs during the HTTP request
      print('Error fetching data: $e');
      return null;
    }
  }
}
