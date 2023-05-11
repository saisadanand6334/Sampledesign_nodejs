import 'package:http/http.dart' as http;

class Api2 {
  final String _Url = "http://192.168.1.83:8000";
  authData(data, apiUrl) async {
    var fullUrl = _Url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }

  getData(apiUrl) async {
    var fullUrl = _Url + apiUrl;
    return await http.get(Uri.parse(fullUrl));
  }
}
