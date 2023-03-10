class Sales {
  String id;
  String price;
  String quantity;
  String total;
  String date;
  String? name;

  Sales({
    required this.id,
    required this.price,
    required this.quantity,
    required this.total,
    required this.date,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'price': this.price,
      'quantity': this.quantity,
      'total': this.total,
      'date': this.date,
    };
  }

  factory Sales.fromMap(Map<String, dynamic> map) {
    return Sales(
      id: map['id'] as String,
      price: map['price'] as String,
      quantity: map['quantity'] as String,
      total: map['total'] as String,
      date: map['date'] as String,
      name: map['name'] as String,
    );
  }
}
