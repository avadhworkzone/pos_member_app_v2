// To parse this JSON data, do
//
//     final itemReponse = itemReponseFromJson(jsonString);

import 'dart:convert';

ItemReponse itemReponseFromJson(String str) =>
    ItemReponse.fromJson(json.decode(str));

String itemReponseToJson(ItemReponse data) => json.encode(data.toJson());

class ItemReponse {
  String? status;
  String? message;
  Data? data;

  ItemReponse({
    this.status,
    this.message,
    this.data,
  });

  factory ItemReponse.fromJson(Map<String, dynamic> json) => ItemReponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
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
  int? brandId;
  String? articleNumber;
  String? coverPic;
  List<int>? categoryIds;
  List<dynamic>? tagIds;
  List<int>? variantIds;
  dynamic originalPrice;
  dynamic sellingPrice;
  dynamic sellingPriceTo;
  int? stocks;
  int? backOrderQty;
  int? preOrderQty;
  int? rank;
  int? viewsCount;
  Brand? brand;
  List<Variant>? variants;
  List<Category>? categories;

  Data({
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
    this.brandId,
    this.articleNumber,
    this.coverPic,
    this.categoryIds,
    this.tagIds,
    this.variantIds,
    this.originalPrice,
    this.sellingPrice,
    this.sellingPriceTo,
    this.stocks,
    this.backOrderQty,
    this.preOrderQty,
    this.rank,
    this.viewsCount,
    this.brand,
    this.variants,
    this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        brandId: json["brandId"],
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
        backOrderQty: json["backOrderQty"],
        preOrderQty: json["preOrderQty"],
        rank: json["rank"],
        viewsCount: json["viewsCount"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
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
        "brandId": brandId,
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
        "backOrderQty": backOrderQty,
        "preOrderQty": preOrderQty,
        "rank": rank,
        "viewsCount": viewsCount,
        "brand": brand?.toJson(),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Brand {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  int? createdBy;
  DateTime? lastChangedDateTime;
  int? updatedBy;
  String? name;
  String? brandId;
  int? itemsCount;
  String? colorId;
  String? sizeId;

  Brand({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.name,
    this.brandId,
    this.itemsCount,
    this.colorId,
    this.sizeId,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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
        brandId: json["brandId"],
        itemsCount: json["itemsCount"],
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
        "brandId": brandId,
        "itemsCount": itemsCount,
        "colorId": colorId,
        "sizeId": sizeId,
      };
}

class Category {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  dynamic createdBy;
  DateTime? lastChangedDateTime;
  dynamic updatedBy;
  int? parentId;
  String? name;
  String? categoryId;
  String? slug;
  String? categoryUrl;
  dynamic coverpic;
  bool? showInMainPageMenu;
  int? priority;
  int? itemsCount;
  int? itemVariantsCount;

  Category({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.parentId,
    this.name,
    this.categoryId,
    this.slug,
    this.categoryUrl,
    this.coverpic,
    this.showInMainPageMenu,
    this.priority,
    this.itemsCount,
    this.itemVariantsCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
        parentId: json["parent_id"],
        name: json["name"],
        categoryId: json["category_id"],
        slug: json["slug"],
        categoryUrl: json["category_url"],
        coverpic: json["coverpic"],
        showInMainPageMenu: json["showInMainPageMenu"],
        priority: json["priority"],
        itemsCount: json["itemsCount"],
        itemVariantsCount: json["itemVariantsCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime?.toIso8601String(),
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "parent_id": parentId,
        "name": name,
        "category_id": categoryId,
        "slug": slug,
        "category_url": categoryUrl,
        "coverpic": coverpic,
        "showInMainPageMenu": showInMainPageMenu,
        "priority": priority,
        "itemsCount": itemsCount,
        "itemVariantsCount": itemVariantsCount,
      };
}

class Variant {
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
  dynamic seasonId;
  int? colorId;
  dynamic styleId;
  int? sizeId;
  dynamic originalPrice;
  dynamic sellingPrice;
  String? upc;
  int? qty;
  int? backOrderQty;
  int? preOrderQty;
  Brand? color;
  Brand? size;
  List<String>? media;
  dynamic openingBalanceQty;
  dynamic closingBalanceQty;

  Variant({
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
    this.seasonId,
    this.colorId,
    this.styleId,
    this.sizeId,
    this.originalPrice,
    this.sellingPrice,
    this.upc,
    this.qty,
    this.backOrderQty,
    this.preOrderQty,
    this.color,
    this.size,
    this.media,
    this.openingBalanceQty,
    this.closingBalanceQty,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
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
        seasonId: json["seasonId"],
        colorId: json["colorId"],
        styleId: json["styleId"],
        sizeId: json["sizeId"],
        originalPrice: json["originalPrice"],
        sellingPrice: json["sellingPrice"],
        upc: json["upc"],
        qty: json["qty"],
        backOrderQty: json["backOrderQty"],
        preOrderQty: json["preOrderQty"],
        color: json["color"] == null ? null : Brand.fromJson(json["color"]),
        size: json["size"] == null ? null : Brand.fromJson(json["size"]),
        media: json["media"] == null
            ? []
            : List<String>.from(json["media"]!.map((x) => x)),
        openingBalanceQty: json["openingBalanceQty"],
        closingBalanceQty: json["closingBalanceQty"],
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
        "seasonId": seasonId,
        "colorId": colorId,
        "styleId": styleId,
        "sizeId": sizeId,
        "originalPrice": originalPrice,
        "sellingPrice": sellingPrice,
        "upc": upc,
        "qty": qty,
        "backOrderQty": backOrderQty,
        "preOrderQty": preOrderQty,
        "color": color?.toJson(),
        "size": size?.toJson(),
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
        "openingBalanceQty": openingBalanceQty,
        "closingBalanceQty": closingBalanceQty,
      };
}
