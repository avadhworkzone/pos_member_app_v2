// To parse this JSON data, do
//
//     final itemsReponse = itemsReponseFromJson(jsonString);

import 'dart:convert';

ItemsReponse itemsReponseFromJson(String str) =>
    ItemsReponse.fromJson(json.decode(str));

String itemsReponseToJson(ItemsReponse data) => json.encode(data.toJson());

class ItemsReponse {
  String? status;
  String? message;
  Data? data;

  ItemsReponse({
    this.status,
    this.message,
    this.data,
  });

  factory ItemsReponse.fromJson(Map<String, dynamic> json) => ItemsReponse(
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
  List<Edge>? edges;
  PageInfo? pageInfo;

  Data({
    this.edges,
    this.pageInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        edges: json["edges"] == null
            ? []
            : List<Edge>.from(json["edges"]!.map((x) => Edge.fromJson(x))),
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? []
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
        "pageInfo": pageInfo?.toJson(),
      };
}

class Edge {
  Node? node;

  Edge({
    this.node,
  });

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        node: json["node"] == null ? null : Node.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class Node {
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
  List<int>? tagIds;
  List<int>? variantIds;
  double? originalPrice;
  int? sellingPrice;
  int? sellingPriceTo;
  int? stocks;
  int? backOrderQty;
  int? preOrderQty;
  int? rank;
  int? viewsCount;
  List<Variant>? variants;

  Node({
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
    this.variants,
  });

  factory Node.fromJson(Map<String, dynamic> json) => Node(
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
            : List<int>.from(json["tagIds"]!.map((x) => x)),
        variantIds: json["variantIds"] == null
            ? []
            : List<int>.from(json["variantIds"]!.map((x) => x)),
        originalPrice: json["originalPrice"]?.toDouble(),
        sellingPrice: json["sellingPrice"],
        sellingPriceTo: json["sellingPriceTo"],
        stocks: json["stocks"],
        backOrderQty: json["backOrderQty"],
        preOrderQty: json["preOrderQty"],
        rank: json["rank"],
        viewsCount: json["viewsCount"],
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
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
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
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
  double? originalPrice;
  double? sellingPrice;
  String? upc;
  int? qty;
  int? backOrderQty;
  int? preOrderQty;
  Color? color;
  Color? size;
  List<String>? media;

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
        originalPrice: json["originalPrice"]?.toDouble(),
        sellingPrice: json["sellingPrice"]?.toDouble(),
        upc: json["upc"],
        qty: json["qty"],
        backOrderQty: json["backOrderQty"],
        preOrderQty: json["preOrderQty"],
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
        size: json["size"] == null ? null : Color.fromJson(json["size"]),
        media: json["media"] == null
            ? []
            : List<String>.from(json["media"]!.map((x) => x)),
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
  int? itemsCount;
  String? slug;
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
    this.itemsCount,
    this.slug,
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
        itemsCount: json["itemsCount"],
        slug: json["slug"],
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
        "itemsCount": itemsCount,
        "slug": slug,
        "sizeId": sizeId,
      };
}

class PageInfo {
  String? pageNo;
  String? sizePerPage;
  int? totalPages;
  int? totalCount;

  PageInfo({
    this.pageNo,
    this.sizePerPage,
    this.totalPages,
    this.totalCount,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        pageNo: json["pageNo"],
        sizePerPage: json["sizePerPage"],
        totalPages: json["totalPages"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "pageNo": pageNo,
        "sizePerPage": sizePerPage,
        "totalPages": totalPages,
        "totalCount": totalCount,
      };
}
