import 'dart:convert';

List<Datum> mymodelFromJson(String str) =>
    List<Datum>.from(json.decode(str)['data'].map((x) => Datum.fromJson(x)));

class Datum {
  String name;
  String symbol;
  Quote quote;

  Datum({required this.name, required this.symbol, required this.quote});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        symbol: json["symbol"],
        quote: Quote.fromJson(json["quote"]),
      );
}

class Quote {
  Quote({
    required this.usd,
  });

  Usd usd;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );
}

class Usd {
  Usd({
    required this.price,
  });

  String price;

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"].toDouble().toStringAsFixed(2),
      );
}
