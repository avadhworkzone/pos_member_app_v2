// To parse this JSON data, do
//
//     final wishlistResponseModel = wishlistResponseModelFromJson(jsonString);

import 'dart:convert';

WishlistResponseModel wishlistResponseModelFromJson(String str) =>
    WishlistResponseModel.fromJson(json.decode(str));

String wishlistResponseModelToJson(WishlistResponseModel data) =>
    json.encode(data.toJson());

class WishlistResponseModel {
  String? status;
  String? message;
  List<Datum>? data;

  WishlistResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory WishlistResponseModel.fromJson(Map<String, dynamic> json) =>
      WishlistResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
