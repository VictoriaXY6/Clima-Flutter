import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response reponse = await http.get(Uri.parse(url));
    if(reponse.statusCode == 200){
      String data = reponse.body;
      return jsonDecode(data);
    } else {
      print(reponse.statusCode);
    }
  }
}