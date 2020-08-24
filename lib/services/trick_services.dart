part of 'services.dart';


class TrickServices {
  static Future<List<Trick>> getTrick({http.Client client}) async {
    String url = trickBase;

    client ??= http.Client();
    var response = await client.get(url);
    var data = json.decode(response.body);
    List results = data['tips_tricks'];
    return results.map((e) => Trick.fromJson(e)).toList();
  }
}
