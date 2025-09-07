
class ItemClass {
  int? id;
  String image;
  String name;
  String price;
  String actualprice;
  int avaliable;
  int total;
  int? quantity;
  String date;
  String categoryid;
  String storeid;

  ItemClass(
      {required this.image,
      this.id,
      required this.name,
      required this.price,
      required this.categoryid,
      required this.actualprice,
      required this.date,
      required this.storeid,
      this.quantity = 1,
      required this.avaliable,
      required this.total});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'actualprice': actualprice,
      'avaliable': avaliable,
      'total': total,
      'date': date,
      'categoryid': categoryid,
      'storeid': storeid,
    };
  }

  factory ItemClass.fromMap(Map<String, dynamic> map) {
    return ItemClass(
      id: map['id'] as int,
      image: map['image'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      actualprice: map['actualprice'] as String,
      avaliable: map['avaliable'] as int,
      total: map['total'] as int,
      date: map['date'] as String,
      categoryid: map['categoryid'] as String,
      storeid: map['storeid'] as String,
    );
  }
}
