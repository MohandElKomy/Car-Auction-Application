class CarsModel {
  CarsModel({
    this.title,
    this.image,
    this.price,
    this.year,
    this.kms,
    this.insurance,
    this.createdAt,
    this.id,
    this.deal,
  });

  String? title;
  String? image;
  String? price;
  String? year;
  String? kms;
  String? insurance;
  String? createdAt;
  String? id;
  List<dynamic>? auctions;
  bool? deal;
  CarsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    price = json['price'];
    year = json['year'];
    kms = json['kms'];
    insurance = json['insurance'];
    createdAt = json['createdAt'];
    id = json['id'];
    auctions = json['auction'];
    deal = json['deal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['year'] = year;
    data['kms'] = kms;
    data['insurance'] = insurance;
    data['createdAt'] = createdAt;
    data['id'] = id;
    data['auction'] = auctions;
    data['deal'] = deal;
    return data;
  }
}

class AuctionModel {
  AuctionModel({this.price, this.phoneNumber});

  String? price;
  String? phoneNumber;

  AuctionModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    phoneNumber = json['phoneNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['phoneNum'] = phoneNumber;
    return data;
  }
}
