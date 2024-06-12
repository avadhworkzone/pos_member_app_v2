// To parse this JSON data, do
//
//     final bannersReponse = bannersReponseFromJson(jsonString);

import 'dart:convert';

BannersReponse bannersReponseFromJson(String str) =>
    BannersReponse.fromJson(json.decode(str));

String bannersReponseToJson(BannersReponse data) => json.encode(data.toJson());

class BannersReponse {
  String? status;
  String? message;
  Data? data;

  BannersReponse({
    this.status,
    this.message,
    this.data,
  });

  factory BannersReponse.fromJson(Map<String, dynamic> json) => BannersReponse(
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
  String? title;
  String? description;
  int? categoryId;
  int? tagId;
  String? action;
  String? size;
  String? position;
  bool? isActive;
  bool? isArchived;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic createdBy;
  dynamic updatedBy;
  String? imageUrl;

  Node({
    this.id,
    this.title,
    this.description,
    this.categoryId,
    this.tagId,
    this.action,
    this.size,
    this.position,
    this.isActive,
    this.isArchived,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.imageUrl,
  });

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        categoryId: json["categoryId"],
        tagId: json["tagId"],
        action: json["action"],
        size: json["size"],
        position: json["position"],
        isActive: json["isActive"],
        isArchived: json["isArchived"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "categoryId": categoryId,
        "tagId": tagId,
        "action": action,
        "size": size,
        "position": position,
        "isActive": isActive,
        "isArchived": isArchived,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "imageUrl": imageUrl,
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
