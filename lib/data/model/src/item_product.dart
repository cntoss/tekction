class ItemProduct {
  String? id;
  String? label;
  String? description;
  double? price;
  String? img;
  int? qte;
  int? sold;
  String? brand;
  String? ownerId;
  String? addressId;
  String? tagId;
  int? count;
  Tag? tag;
  Address? address;
  String? currency;
  String? symbol;
  bool? shipping;
  bool? collect;
  List<StockItem>? stocks;

  ItemProduct({
    this.id,
    this.label,
    this.description,
    this.price,
    this.img,
    this.qte,
    this.sold,
    this.brand,
    this.ownerId,
    this.addressId,
    this.tagId,
    this.count,
    this.tag,
    this.address,
    this.currency,
    this.symbol,
    this.shipping,
    this.collect,
    this.stocks,
  });
}

class Tag {
  String? id;
  String? name;
  String? description;
  String? img;
  String? ref;
  int? status;
  String? createdAt;

  Tag({
    this.id,
    this.name,
    this.description,
    this.img,
    this.ref,
    this.status,
    this.createdAt,
  });
}

class Address {
  String? id;
  int? status;
  String? name;
  double? lat;
  double? lng;
  String? description;
  String? city;
  String? zipCode;
  String? createdAt;
  String? userId;

  Address({
    this.id,
    this.status,
    this.name,
    this.lat,
    this.lng,
    this.description,
    this.city,
    this.zipCode,
    this.createdAt,
    this.userId,
  });
}

class StockItem {
  String? id;
  int? qte;
  int? sold;
  String? sizeId;
  String? productId;
  String? name;
  SizeItem? size;
  bool? select;
  StockItem({
    this.id,
    this.qte,
    this.sold,
    this.sizeId,
    this.productId,
    this.name,
    this.size,
    this.select,
  });
}

class SizeItem {
  String? id;
  String? name;
  String? description;
  int? status;
  String? createdAt;
  SizeItem({
    this.id,
    this.name,
    this.description,
    this.status,
    this.createdAt,
  });
}
