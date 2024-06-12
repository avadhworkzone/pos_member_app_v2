// To parse this JSON data, do
//
//     final cartSummaryResponseModel = cartSummaryResponseModelFromJson(jsonString);

import 'dart:convert';

CartSummaryResponseModel cartSummaryResponseModelFromJson(String str) =>
    CartSummaryResponseModel.fromJson(json.decode(str));

String cartSummaryResponseModelToJson(CartSummaryResponseModel data) =>
    json.encode(data.toJson());

class CartSummaryResponseModel {
  Voucher? voucher;
  List<CartItem>? cartItems;
  dynamic subTotal;
  dynamic itemWiseDiscount;
  dynamic voucherDiscountAmount;
  dynamic tax;
  dynamic totalDiscount;
  double? total;
  dynamic taxable;
  dynamic taxPercent;

  CartSummaryResponseModel({
    this.voucher,
    this.cartItems,
    this.subTotal,
    this.itemWiseDiscount,
    this.voucherDiscountAmount,
    this.tax,
    this.totalDiscount,
    this.total,
    this.taxable,
    this.taxPercent,
  });

  factory CartSummaryResponseModel.fromJson(Map<String, dynamic> json) =>
      CartSummaryResponseModel(
        voucher:
            json["voucher"] == null ? null : Voucher.fromJson(json["voucher"]),
        cartItems: json["cartItems"] == null
            ? []
            : List<CartItem>.from(
                json["cartItems"]!.map((x) => CartItem.fromJson(x))),
        subTotal: json["subTotal"],
        itemWiseDiscount: json["itemWiseDiscount"],
        voucherDiscountAmount: json["voucherDiscountAmount"],
        tax: json["tax"]?.toDouble(),
        totalDiscount: json["totalDiscount"],
        total: json["total"]?.toDouble(),
        taxable: json["taxable"],
        taxPercent: json["taxPercent"],
      );

  Map<String, dynamic> toJson() => {
        "voucher": voucher?.toJson(),
        "cartItems": cartItems == null
            ? []
            : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
        "subTotal": subTotal,
        "itemWiseDiscount": itemWiseDiscount,
        "voucherDiscountAmount": voucherDiscountAmount,
        "tax": tax,
        "totalDiscount": totalDiscount,
        "total": total,
        "taxable": taxable,
        "taxPercent": taxPercent,
      };
}

class CartItem {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  dynamic createdBy;
  DateTime? lastChangedDateTime;
  dynamic updatedBy;
  int? userId;
  int? itemId;
  int? itemVariantId;
  int? quantity;
  Item? item;
  ItemVariant? itemVariant;
  int? promotionId;
  int? promotionGroupId;
  dynamic itemWiseDiscountPercentage;
  dynamic voucherCodeDiscountPercent;
  Price? price;

  CartItem({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.userId,
    this.itemId,
    this.itemVariantId,
    this.quantity,
    this.item,
    this.itemVariant,
    this.promotionId,
    this.promotionGroupId,
    this.itemWiseDiscountPercentage,
    this.voucherCodeDiscountPercent,
    this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        isActive: json["isActive"],
        isArchived: json["isArchived"],
        createDateTime: json["createDateTime"] == null
            ? null
            : DateTime.parse(json["createDateTime"]),
        createdBy: json["createdBy"],
        lastChangedDateTime: json["lastChangedDateTime"] == null
            ? null
            : DateTime.parse(json["lastChangedDateTime"]),
        updatedBy: json["updatedBy"],
        userId: json["userId"],
        itemId: json["itemId"],
        itemVariantId: json["itemVariantId"],
        quantity: json["quantity"],
        item: json["item"] == null ? null : Item.fromJson(json["item"]),
        itemVariant: json["itemVariant"] == null
            ? null
            : ItemVariant.fromJson(json["itemVariant"]),
        promotionId: json["promotionId"],
        promotionGroupId: json["promotionGroupId"],
        itemWiseDiscountPercentage: json["itemWiseDiscountPercentage"],
        voucherCodeDiscountPercent:
            json["voucherCodeDiscountPercent"]?.toDouble(),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime?.toIso8601String(),
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "userId": userId,
        "itemId": itemId,
        "itemVariantId": itemVariantId,
        "quantity": quantity,
        "item": item?.toJson(),
        "itemVariant": itemVariant?.toJson(),
        "promotionId": promotionId,
        "promotionGroupId": promotionGroupId,
        "itemWiseDiscountPercentage": itemWiseDiscountPercentage,
        "voucherCodeDiscountPercent": voucherCodeDiscountPercent,
        "price": price?.toJson(),
      };
}

class Item {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  dynamic createdBy;
  DateTime? lastChangedDateTime;
  dynamic updatedBy;
  String? name;
  String? description;
  String? slug;
  String? itemId;
  String? articleNumber;
  String? coverPic;
  List<int>? categoryIds;
  List<dynamic>? tagIds;
  List<int>? variantIds;
  dynamic originalPrice;
  dynamic sellingPrice;
  dynamic sellingPriceTo;
  int? stocks;

  Item({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.name,
    this.description,
    this.slug,
    this.itemId,
    this.articleNumber,
    this.coverPic,
    this.categoryIds,
    this.tagIds,
    this.variantIds,
    this.originalPrice,
    this.sellingPrice,
    this.sellingPriceTo,
    this.stocks,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        isActive: json["isActive"],
        isArchived: json["isArchived"],
        createDateTime: json["createDateTime"] == null
            ? null
            : DateTime.parse(json["createDateTime"]),
        createdBy: json["createdBy"],
        lastChangedDateTime: json["lastChangedDateTime"] == null
            ? null
            : DateTime.parse(json["lastChangedDateTime"]),
        updatedBy: json["updatedBy"],
        name: json["name"],
        description: json["description"],
        slug: json["slug"],
        itemId: json["itemId"],
        articleNumber: json["articleNumber"],
        coverPic: json["coverPic"],
        categoryIds: json["categoryIds"] == null
            ? []
            : List<int>.from(json["categoryIds"]!.map((x) => x)),
        tagIds: json["tagIds"] == null
            ? []
            : List<dynamic>.from(json["tagIds"]!.map((x) => x)),
        variantIds: json["variantIds"] == null
            ? []
            : List<int>.from(json["variantIds"]!.map((x) => x)),
        originalPrice: json["originalPrice"],
        sellingPrice: json["sellingPrice"],
        sellingPriceTo: json["sellingPriceTo"],
        stocks: json["stocks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime?.toIso8601String(),
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "name": name,
        "description": description,
        "slug": slug,
        "itemId": itemId,
        "articleNumber": articleNumber,
        "coverPic": coverPic,
        "categoryIds": categoryIds == null
            ? []
            : List<dynamic>.from(categoryIds!.map((x) => x)),
        "tagIds":
            tagIds == null ? [] : List<dynamic>.from(tagIds!.map((x) => x)),
        "variantIds": variantIds == null
            ? []
            : List<dynamic>.from(variantIds!.map((x) => x)),
        "originalPrice": originalPrice,
        "sellingPrice": sellingPrice,
        "sellingPriceTo": sellingPriceTo,
        "stocks": stocks,
      };
}

class ItemVariant {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  dynamic createdBy;
  DateTime? lastChangedDateTime;
  dynamic updatedBy;
  int? itemId;
  String? variantId;
  String? name;
  int? colorId;
  int? sizeId;
  dynamic originalPrice;
  dynamic sellingPrice;
  String? upc;
  List<String>? media;
  Color? color;
  Color? size;

  ItemVariant({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.itemId,
    this.variantId,
    this.name,
    this.colorId,
    this.sizeId,
    this.originalPrice,
    this.sellingPrice,
    this.upc,
    this.media,
    this.color,
    this.size,
  });

  factory ItemVariant.fromJson(Map<String, dynamic> json) => ItemVariant(
        id: json["id"],
        isActive: json["isActive"],
        isArchived: json["isArchived"],
        createDateTime: json["createDateTime"] == null
            ? null
            : DateTime.parse(json["createDateTime"]),
        createdBy: json["createdBy"],
        lastChangedDateTime: json["lastChangedDateTime"] == null
            ? null
            : DateTime.parse(json["lastChangedDateTime"]),
        updatedBy: json["updatedBy"],
        itemId: json["itemId"],
        variantId: json["variantId"],
        name: json["name"],
        colorId: json["colorId"],
        sizeId: json["sizeId"],
        originalPrice: json["originalPrice"],
        sellingPrice: json["sellingPrice"],
        upc: json["upc"],
        media: json["media"] == null
            ? []
            : List<String>.from(json["media"]!.map((x) => x)),
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
        size: json["size"] == null ? null : Color.fromJson(json["size"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime?.toIso8601String(),
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "itemId": itemId,
        "variantId": variantId,
        "name": name,
        "colorId": colorId,
        "sizeId": sizeId,
        "originalPrice": originalPrice,
        "sellingPrice": sellingPrice,
        "upc": upc,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
        "color": color?.toJson(),
        "size": size?.toJson(),
      };
}

class Color {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  dynamic createdBy;
  DateTime? lastChangedDateTime;
  dynamic updatedBy;
  String? name;
  String? colorId;
  String? sizeId;

  Color({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.name,
    this.colorId,
    this.sizeId,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        isActive: json["isActive"],
        isArchived: json["isArchived"],
        createDateTime: json["createDateTime"] == null
            ? null
            : DateTime.parse(json["createDateTime"]),
        createdBy: json["createdBy"],
        lastChangedDateTime: json["lastChangedDateTime"] == null
            ? null
            : DateTime.parse(json["lastChangedDateTime"]),
        updatedBy: json["updatedBy"],
        name: json["name"],
        colorId: json["colorId"],
        sizeId: json["sizeId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime?.toIso8601String(),
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "name": name,
        "colorId": colorId,
        "sizeId": sizeId,
      };
}

class Price {
  dynamic voucherDiscountAmount;
  dynamic total;
  dynamic taxable;
  dynamic tax;
  dynamic subTotal;
  dynamic totalDiscount;
  dynamic itemWiseDiscount;
  dynamic cartWideDiscount;

  Price({
    this.voucherDiscountAmount,
    this.total,
    this.taxable,
    this.tax,
    this.subTotal,
    this.totalDiscount,
    this.itemWiseDiscount,
    this.cartWideDiscount,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        voucherDiscountAmount: json["voucherDiscountAmount"]?.toDouble(),
        total: json["total"]?.toDouble(),
        taxable: json["taxable"]?.toDouble(),
        tax: json["tax"]?.toDouble(),
        subTotal: json["subTotal"],
        totalDiscount: json["totalDiscount"]?.toDouble(),
        itemWiseDiscount: json["itemWiseDiscount"],
        cartWideDiscount: json["cartWideDiscount"],
      );

  Map<String, dynamic> toJson() => {
        "voucherDiscountAmount": voucherDiscountAmount,
        "total": total,
        "taxable": taxable,
        "tax": tax,
        "subTotal": subTotal,
        "totalDiscount": totalDiscount,
        "itemWiseDiscount": itemWiseDiscount,
        "cartWideDiscount": cartWideDiscount,
      };
}

class Voucher {
  String? voucherCode;

  Voucher({
    this.voucherCode,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        voucherCode: json["voucherCode"],
      );

  Map<String, dynamic> toJson() => {
        "voucherCode": voucherCode,
      };
}
