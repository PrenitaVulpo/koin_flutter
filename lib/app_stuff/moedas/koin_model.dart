import 'package:koin_flutter/common/netConnector.dart';


const coinApiURL = 'https://rest.coinapi.io/v1/exchangerate';
const key = 'D378B676-43E6-455C-9E5B-5CC598500761';

class KoinModel {
  Future<dynamic> getCurrencies(String crypto, String currency) async {
    var url = '$coinApiURL/$crypto/$currency';
    print(url);

    Map<String, String> headers = {'X-CoinAPI-Key': '$key'};

    NetworkHelper networkHelper = NetworkHelper(url, headers);

    var currenciesData = await networkHelper.getData();

    return currenciesData;
  }
}