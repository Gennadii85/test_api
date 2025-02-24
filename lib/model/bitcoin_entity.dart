class BitcoinEntity {
  final String? id;
  final String? symbol;
  final String? currencySymbol;
  final String? type;
  final double? rateUsd;

  BitcoinEntity({
    required this.id,
    required this.symbol,
    required this.currencySymbol,
    required this.type,
    required this.rateUsd,
  });
  // Автогенерация требует дополнительных настроек - поэтому реализуем вручную

  factory BitcoinEntity.fromJson(Map<String, dynamic> json) {
    return BitcoinEntity(
      id: json['id'],
      symbol: json['symbol'],
      currencySymbol: json['currencySymbol'],
      type: json['type'],
      rateUsd: double.parse(json['rateUsd']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'currencySymbol': currencySymbol,
      'type': type,
      'rateUsd': rateUsd.toString(),
    };
  }
}
