import 'package:koin_flutter/common/coinData.dart';
import 'package:koin_flutter/widgets/valor_widget.dart';
import 'package:flutter/material.dart';

import 'koin_model.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<ValorWidget> _valorwidget = [];
  final KoinModel koin = KoinModel();

  bool _loading = true;
  String _currencySelected = currenciesList[0];
  dynamic btc = 0.0;
  dynamic eth = 0.0;
  dynamic ltc = 0.0;

  void _renderCryptoList() async {
    var btc_data = await koin.getCurrencies('BTC', _currencySelected);
    var eth_data = await koin.getCurrencies('ETH', _currencySelected);
    var ltc_data = await koin.getCurrencies('LTC', _currencySelected);

    setState(() {
      btc = btc_data['rate'];
      eth = eth_data['rate'];
      ltc = ltc_data['rate'];
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _renderCryptoList();
  }

  void _modifyCurrency(newValue) async {
    _renderCryptoList();
    setState(() {
      _loading = true;
      _currencySelected = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coinapp'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: _loading
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Column(
                children: [
                  ValorWidget(
                    'BTC',
                    btc,
                    _currencySelected,
                  ),
                  ValorWidget(
                    'ETH',
                    eth,
                    _currencySelected,
                  ),
                  ValorWidget(
                    'LTC',
                    ltc,
                    _currencySelected,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButton<String>(
                value: _currencySelected,
                icon: Icon(Icons.attach_money),
                iconEnabledColor: Colors.blue,
                iconDisabledColor: Colors.grey,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) => _modifyCurrency(newValue),
                items: currenciesList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}