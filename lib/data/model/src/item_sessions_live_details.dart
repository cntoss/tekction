// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'item_product.dart';
import 'user.dart';

class ItemSessionsLiveDetails {
  final String? id;
  final String? name;
  final String? startAt;
  final String? description;
  final String? img;
  final String? preview;
  final int? status;
  final String? createdAt;
  final String? userId;
  final MainUser? user;
  final List<Reservation>? reservations;
  final List<ProductElement>? products;
  ItemSessionsLiveDetails({
    this.id,
    this.name,
    this.startAt,
    this.description,
    this.img,
    this.preview,
    this.status,
    this.createdAt,
    this.userId,
    this.user,
    this.reservations,
    this.products,
  });
}

class Reservation {
  final String? id;
  final String? createdAt;
  final String? userId;
  final String? sessionId;
  Reservation({
    this.id,
    this.createdAt,
    this.userId,
    this.sessionId,
  });
}

class ProductElement {
  final String? id;
  final String? createdAt;
  final String? sessionId;
  final String? productId;
  final double? price;
  final int? qte;
  final int? num;
  final ItemProduct? product;
  ProductElement({
    this.id,
    this.createdAt,
    this.sessionId,
    this.productId,
    this.price,
    this.qte,
    this.num,
    this.product,
  });
}
