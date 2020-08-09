import 'package:flutter/material.dart';

class ValorWidget extends StatelessWidget {
  final String _cryptoCType;
  final String _moedaFType;
  final double _convert;


  ValorWidget(this._cryptoCType, this._convert, this._moedaFType);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset.zero,
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Text('1 $_cryptoCType = $_convert $_moedaFType'),
    );
  }
}