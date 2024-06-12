// To parse this JSON data, do
//
//     final categoriesReponse = categoriesReponseFromJson(jsonString);

import 'dart:convert';

CategoriesReponse categoriesReponseFromJson(String str) =>
    CategoriesReponse.fromJson(json.decode(str));

String categoriesReponseToJson(CategoriesReponse data) =>
    json.encode(data.toJson());

class CategoriesReponse {
  String? status;
  String? message;
  Data? data;

  CategoriesReponse({
    this.status,
    this.message,
    this.data,
  });

  factory CategoriesReponse.fromJson(Map<String, dynamic> json) =>
      CategoriesReponse(
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
  int? parentId;
  String? name;
  String? categoryId;
  String? slug;
  String? categoryUrl;
  String? coverpic;
  bool? showInMainPageMenu;
  int? priority;
  int? itemsCount;
  int? itemVariantsCount;
  Node? parent;
  List<Node>? subCategories;

  Node({
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
    this.parent,
    this.subCategories,
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
        parent: json["parent"] == null ? null : Node.fromJson(json["parent"]),
        subCategories: json["subCategories"] == null
            ? []
            : List<Node>.from(
                json["subCategories"]!.map((x) => Node.fromJson(x))),
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
        "parent": parent?.toJson(),
        "subCategories": subCategories == null
            ? []
            : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
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
