part of 'services.dart';

class NewsServices {
  static Future<List<News>> getNews({http.Client client}) async {
    String url = newsBase;

    client ??= http.Client();
    var response = await client.get(url);
    var data = json.decode(response.body);
    List results = data['beritas'];
    return results.map((e) => News.fromJson(e)).toList();
  }
}
