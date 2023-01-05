import 'item_product.dart';
import 'item_sessions_live_details.dart';
import 'user.dart';

class OrderDetails {
  OrderDetails({
    this.id,
    this.status,
    this.payment,
    this.collect,
    this.priceProd,
    this.priceDel,
    this.total,
    this.createdAt,
    this.labelUrl,
    this.shipmentId,
    this.pickupId,
    this.pickupDelId,
    this.address,
    this.userId,
    this.addressId,
    this.ref,
    this.user,
    this.creator,
    this.products,
  });

  String? id;
  int? status;
  int? payment;
  int? collect;
  double? priceProd;
  int? priceDel;
  double? total;
  String? createdAt;
  String? labelUrl;
  String? shipmentId;
  String? pickupId;
  String? pickupDelId;
  Address? address;
  String? userId;
  String? addressId;
  String? ref;
  MainUser? user;
  MainUser? creator;
  List<ProductElement>? products;
}
