import 'item_product.dart';
import 'user.dart';

class CartDetailsItem {
  final String? id;
  final int? status;
  final String? createdAt;
  final double? price;
  final int? qte;
  final String? userId;
  final String? productId;
  final ItemProduct? product;
  final MainUser? user;
  final StockItem? stock;
  final SizeItem? size;

  CartDetailsItem({
    this.id,
    this.status,
    this.createdAt,
    this.price,
    this.qte,
    this.userId,
    this.productId,
    this.product,
    this.user,
    this.stock,
    this.size,
  });
}
