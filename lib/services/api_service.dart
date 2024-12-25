import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Position position;
  const ApiService({required this.position});


  //Créer la requete url
  Uri urlRequest() {
    const apiKey = "3c3d06764b514bd781d213856242512";
    const baseUrl = "https://api.weatherapi.com/v1/forecast.json";
    const days = "5";
    const lang = "fr";
    String q = "${position.latitude},${position.longitude}";

    String urlString = "$baseUrl?key=$apiKey&q=$q&lang=$lang&days=$days";

    return Uri.parse(urlString);
  }

  //Faire l'appel à l'api
  Future callApi() async {
    final result = await http.get(urlRequest());
    final body = result.body;
    print(urlRequest());
  }
}