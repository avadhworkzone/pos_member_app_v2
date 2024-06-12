// To parse this JSON data, do
//
//     final brandsReponse = brandsReponseFromJson(jsonString);

import 'dart:convert';

BrandsReponse brandsReponseFromJson(String str) =>
    BrandsReponse.fromJson(json.decode(str));

String brandsReponseToJson(BrandsReponse data) => json.encode(data.toJson());

class BrandsReponse {
  String? status;
  String? message;
  Data? data;

  BrandsReponse({
    this.status,
    this.message,
    this.data,
  });

  factory BrandsReponse.fromJson(Map<String, dynamic> json) => BrandsReponse(
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
  dynamic createDateTime;
  int? createdBy;
  DateTime? lastChangedDateTime;
  int? updatedBy;
  String? name;
  String? brandId;
  int? itemsCount;
  String? slug;

  Node({
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
    this.slug,
  });

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        isActive: json["isActive"],
        isArchived: json["isArchived"],
        createDateTime: json["createDateTime"],
        createdBy: json["createdBy"],
        lastChangedDateTime: json["lastChangedDateTime"] == null
            ? null
            : DateTime.parse(json["lastChangedDateTime"]),
        updatedBy: json["updatedBy"],
        name: json["name"],
        brandId: json["brandId"],
        itemsCount: json["itemsCount"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime,
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "name": name,
        "brandId": brandId,
        "itemsCount": itemsCount,
        "slug": slug,
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
