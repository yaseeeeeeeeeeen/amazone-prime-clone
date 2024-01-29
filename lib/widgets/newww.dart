import 'package:http/http.dart' as http;

Future<void> neww() async {
  final url = "";
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {}
}

Future<void> posttt() async {
  final url = "";
  final uri = Uri.parse(url);
  final body = {
    "hhh": "jjj",
  };
  final response = await http.post(uri, body: body, headers: {"content-Json"});
}
