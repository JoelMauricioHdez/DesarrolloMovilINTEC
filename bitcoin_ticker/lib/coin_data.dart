import 'dart:convert';
import 'package:http/http.dart' as request;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  static Future<List<dynamic>> getCoinData() async {
    var data = [];

    try {
      for (final String crypto in cryptoList) {
        var url =
            "https://rest.coinapi.io/v1/exchangerate/${crypto}?apikey=F8FDBDAF-FA23-4953-AA2C-89461C5F2895";
        var response = await request.get(Uri.parse(url));
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
          data.add(jsonResponse);
        } else {
          print(response.statusCode);
          data.add("error");
        }
      }
    } catch (error) {
      print(error);
      data = ["error", "error", "error"];
    }
    return data;
  }

  static List<dynamic> getCurrencyChange(List<dynamic> data, String currency) {
    late List<dynamic> tempRate = [];
    if (data.contains("error")) {
      return tempRate = ["", "", ""];
    }
    for (final dynamic response in data) {
      for (final dynamic value in response["rates"]) {
        if (value["asset_id_quote"] == currency) {
          var amount = value["rate"].toString().split('.');
          tempRate.add('${amount[0]}.${amount[1].substring(1, 3)}');
        }
      }
    }
    return tempRate;
  }
}
