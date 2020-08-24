part of 'services.dart';

class JasaServices {
  static Future<List<Services>> getJasaService({http.Client client}) async {
    String url = servicesBase;

    client ??= http.Client();
    var response = await client.get(url);
    var data = json.decode(response.body);
    List results = data['services'];
    return results.map((e) => Services.fromJson(e)).toList();
  }

  static Future<List<ServiceDetail>> getDetailService(
      {http.Client client}) async {
    String url = detailServicePage;
    client ??= http.Client();
    var response = await client.get(url);
    var data = json.decode(response.body);
    return data;
  }
}
