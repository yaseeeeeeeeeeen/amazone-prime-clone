import 'dart:async';
import 'dart:convert';

import 'package:amazon_prime/services/movies_picture.dart';
import 'package:http/http.dart' as http;

class MoviesList {
  static Future<List<Movies>> dataFetch({required String apiUrl}) async {
    final url = apiUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json["results"] as List<dynamic>;
    final movies = result.map((e) {
      return Movies.fromMap(e);
    }).toList();
    return movies;
  }

  static Future<List<Movies>> search(value) async {
    if (value == null) {
      return [];
    }
    final url =
        "https://api.themoviedb.org/3/search/movie?query=${value}&include_adult=false&language=en-US&api_key=f2b8b3296ac3f32e7e489cf9e9b4cac0";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['results'] as List<dynamic>;
      final movies = result.map((e) {
        return Movies.fromMap(e);
      }).toList();
      return movies;
    } else {
      return [];
    }
  }
}
