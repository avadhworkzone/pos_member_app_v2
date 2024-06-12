// To parse this JSON data, do
//
//     final orderResponseModel = orderResponseModelFromJson(jsonString);

import 'dart:convert';

OrderResponseModel orderResponseModelFromJson(String str) =>
    OrderResponseModel.fromJson(json.decode(str));

String orderResponseModelToJson(OrderResponseModel data) =>
    json.encode(data.toJson());

class OrderResponseModel {
  String? status;
  String? message;
  OrderResponseModelData? data;

  OrderResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : OrderResponseModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class OrderResponseModelData {
  List<Order>? orders;
  PageInfo? pageInfo;

  OrderResponseModelData({
    this.orders,
    this.pageInfo,
  });

  factory OrderResponseModelData.fromJson(Map<String, dynamic> json) =>
      OrderResponseModelData(
        orders: json["orders"] == null
            ? []
            : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "orders": orders == null
            ? []
            : List<dynamic>.from(orders!.map((x) => x.toJson())),
        "pageInfo": pageInfo?.toJson(),
      };
}

class Order {
  Node? node;

  Order({
    this.node,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
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
  int? createdBy;
  DateTime? lastChangedDateTime;
  int? updatedBy;
  int? customerId;
  String? uuid;
  dynamic totalPaid;
  double? total;
  dynamic discountPrice;
  double? itemWiseDiscount;
  String? voucher;
  int? voucherDiscountAmount;
  double? totalDiscount;
  double? taxable;
  double? tax;
  int? subTotal;
  String? paymentStatus;
  String? paymentType;
  String? orderStatus;
  String? pickupType;
  DeliveryAddressClass? deliveryAddress;
  DeliveryAddressClass? pickUpAddress;
  dynamic deliveryInstruction;
  bool? leaveAtDoor;
  dynamic invoiceAddress;
  BeehiveResponse? beehiveResponse;
  String? trackingId;
  int? referrerId;
  List<OrderItem>? orderItems;
  List<OrderStatusLog>? orderStatusLogs;
  UserInfo? userInfo;

  Node({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.customerId,
    this.uuid,
    this.totalPaid,
    this.total,
    this.discountPrice,
    this.itemWiseDiscount,
    this.voucher,
    this.voucherDiscountAmount,
    this.totalDiscount,
    this.taxable,
    this.tax,
    this.subTotal,
    this.paymentStatus,
    this.paymentType,
    this.orderStatus,
    this.pickupType,
    this.deliveryAddress,
    this.pickUpAddress,
    this.deliveryInstruction,
    this.leaveAtDoor,
    this.invoiceAddress,
    this.beehiveResponse,
    this.trackingId,
    this.referrerId,
    this.orderItems,
    this.orderStatusLogs,
    this.userInfo,
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
        customerId: json["customerId"],
        uuid: json["uuid"],
        totalPaid: json["totalPaid"],
        total: json["total"]?.toDouble(),
        discountPrice: json["discountPrice"],
        itemWiseDiscount: json["itemWiseDiscount"]?.toDouble(),
        voucher: json["voucher"],
        voucherDiscountAmount: json["voucherDiscountAmount"],
        totalDiscount: json["totalDiscount"]?.toDouble(),
        taxable: json["taxable"]?.toDouble(),
        tax: json["tax"]?.toDouble(),
        subTotal: json["subTotal"],
        paymentStatus: json["paymentStatus"],
        paymentType: json["paymentType"],
        orderStatus: json["orderStatus"],
        pickupType: json["pickupType"],
        deliveryAddress: json["deliveryAddress"] == null
            ? null
            : DeliveryAddressClass.fromJson(json["deliveryAddress"]),
        pickUpAddress: json["pickUpAddress"] == null
            ? null
            : DeliveryAddressClass.fromJson(json["pickUpAddress"]),
        deliveryInstruction: json["deliveryInstruction"],
        leaveAtDoor: json["leaveAtDoor"],
        invoiceAddress: json["invoiceAddress"],
        beehiveResponse: json["beehiveResponse"] == null
            ? null
            : BeehiveResponse.fromJson(json["beehiveResponse"]),
        trackingId: json["trackingId"],
        referrerId: json["referrerId"],
        orderItems: json["orderItems"] == null
            ? []
            : List<OrderItem>.from(
                json["orderItems"]!.map((x) => OrderItem.fromJson(x))),
        orderStatusLogs: json["orderStatusLogs"] == null
            ? []
            : List<OrderStatusLog>.from(json["orderStatusLogs"]!
                .map((x) => OrderStatusLog.fromJson(x))),
        userInfo: json["userInfo"] == null
            ? null
            : UserInfo.fromJson(json["userInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime?.toIso8601String(),
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "customerId": customerId,
        "uuid": uuid,
        "totalPaid": totalPaid,
        "total": total,
        "discountPrice": discountPrice,
        "itemWiseDiscount": itemWiseDiscount,
        "voucher": voucher,
        "voucherDiscountAmount": voucherDiscountAmount,
        "totalDiscount": totalDiscount,
        "taxable": taxable,
        "tax": tax,
        "subTotal": subTotal,
        "paymentStatus": paymentStatus,
        "paymentType": paymentType,
        "orderStatus": orderStatus,
        "pickupType": pickupType,
        "deliveryAddress": deliveryAddress?.toJson(),
        "pickUpAddress": pickUpAddress?.toJson(),
        "deliveryInstruction": deliveryInstruction,
        "leaveAtDoor": leaveAtDoor,
        "invoiceAddress": invoiceAddress,
        "beehiveResponse": beehiveResponse?.toJson(),
        "trackingId": trackingId,
        "referrerId": referrerId,
        "orderItems": orderItems == null
            ? []
            : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
        "orderStatusLogs": orderStatusLogs == null
            ? []
            : List<dynamic>.from(orderStatusLogs!.map((x) => x.toJson())),
        "userInfo": userInfo?.toJson(),
      };
}

class BeehiveResponse {
  bool? status;
  String? msg;
  BeehiveResponseData? data;
  Err? err;

  BeehiveResponse({
    this.status,
    this.msg,
    this.data,
    this.err,
  });

  factory BeehiveResponse.fromJson(Map<String, dynamic> json) =>
      BeehiveResponse(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null
            ? null
            : BeehiveResponseData.fromJson(json["data"]),
        err: json["err"] == null ? null : Err.fromJson(json["err"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data?.toJson(),
        "err": err?.toJson(),
      };
}

class BeehiveResponseData {
  String? requestedTrackingNumber;
  String? trackingNumber;
  String? serviceType;
  String? serviceLevel;
  Reference? reference;
  From? from;
  From? to;
  ParcelJob? parcelJob;

  BeehiveResponseData({
    this.requestedTrackingNumber,
    this.trackingNumber,
    this.serviceType,
    this.serviceLevel,
    this.reference,
    this.from,
    this.to,
    this.parcelJob,
  });

  factory BeehiveResponseData.fromJson(Map<String, dynamic> json) =>
      BeehiveResponseData(
        requestedTrackingNumber: json["requested_tracking_number"],
        trackingNumber: json["tracking_number"],
        serviceType: json["service_type"],
        serviceLevel: json["service_level"],
        reference: json["reference"] == null
            ? null
            : Reference.fromJson(json["reference"]),
        from: json["from"] == null ? null : From.fromJson(json["from"]),
        to: json["to"] == null ? null : From.fromJson(json["to"]),
        parcelJob: json["parcel_job"] == null
            ? null
            : ParcelJob.fromJson(json["parcel_job"]),
      );

  Map<String, dynamic> toJson() => {
        "requested_tracking_number": requestedTrackingNumber,
        "tracking_number": trackingNumber,
        "service_type": serviceType,
        "service_level": serviceLevel,
        "reference": reference?.toJson(),
        "from": from?.toJson(),
        "to": to?.toJson(),
        "parcel_job": parcelJob?.toJson(),
      };
}

class From {
  String? name;
  String? phoneNumber;
  String? email;
  Address? address;
  String? sortCode;

  From({
    this.name,
    this.phoneNumber,
    this.email,
    this.address,
    this.sortCode,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        sortCode: json["sort_code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
        "address": address?.toJson(),
        "sort_code": sortCode,
      };
}

class Address {
  String? address1;
  String? address2;
  String? country;

  Address({
    this.address1,
    this.address2,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address1: json["address1"],
        address2: json["address2"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "address1": address1,
        "address2": address2,
        "country": country,
      };
}

class ParcelJob {
  bool? isPickupRequired;
  String? pickupServiceType;
  String? pickupServiceLevel;
  String? pickupAddressId;
  DateTime? pickupDate;
  Timeslot? pickupTimeslot;
  String? pickupApproximateVolume;
  String? pickupInstructions;
  DateTime? deliveryStartDate;
  Timeslot? deliveryTimeslot;
  String? deliveryInstructions;
  bool? allowWeekendDelivery;
  Dimensions? dimensions;
  List<Item>? items;

  ParcelJob({
    this.isPickupRequired,
    this.pickupServiceType,
    this.pickupServiceLevel,
    this.pickupAddressId,
    this.pickupDate,
    this.pickupTimeslot,
    this.pickupApproximateVolume,
    this.pickupInstructions,
    this.deliveryStartDate,
    this.deliveryTimeslot,
    this.deliveryInstructions,
    this.allowWeekendDelivery,
    this.dimensions,
    this.items,
  });

  factory ParcelJob.fromJson(Map<String, dynamic> json) => ParcelJob(
        isPickupRequired: json["is_pickup_required"],
        pickupServiceType: json["pickup_service_type"],
        pickupServiceLevel: json["pickup_service_level"],
        pickupAddressId: json["pickup_address_id"],
        pickupDate: json["pickup_date"] == null
            ? null
            : DateTime.parse(json["pickup_date"]),
        pickupTimeslot: json["pickup_timeslot"] == null
            ? null
            : Timeslot.fromJson(json["pickup_timeslot"]),
        pickupApproximateVolume: json["pickup_approximate_volume"],
        pickupInstructions: json["pickup_instructions"],
        deliveryStartDate: json["delivery_start_date"] == null
            ? null
            : DateTime.parse(json["delivery_start_date"]),
        deliveryTimeslot: json["delivery_timeslot"] == null
            ? null
            : Timeslot.fromJson(json["delivery_timeslot"]),
        deliveryInstructions: json["delivery_instructions"],
        allowWeekendDelivery: json["allow_weekend_delivery"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "is_pickup_required": isPickupRequired,
        "pickup_service_type": pickupServiceType,
        "pickup_service_level": pickupServiceLevel,
        "pickup_address_id": pickupAddressId,
        "pickup_date":
            "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
        "pickup_timeslot": pickupTimeslot?.toJson(),
        "pickup_approximate_volume": pickupApproximateVolume,
        "pickup_instructions": pickupInstructions,
        "delivery_start_date":
            "${deliveryStartDate!.year.toString().padLeft(4, '0')}-${deliveryStartDate!.month.toString().padLeft(2, '0')}-${deliveryStartDate!.day.toString().padLeft(2, '0')}",
        "delivery_timeslot": deliveryTimeslot?.toJson(),
        "delivery_instructions": deliveryInstructions,
        "allow_weekend_delivery": allowWeekendDelivery,
        "dimensions": dimensions?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Timeslot {
  String? startTime;
  String? endTime;
  String? timezone;

  Timeslot({
    this.startTime,
    this.endTime,
    this.timezone,
  });

  factory Timeslot.fromJson(Map<String, dynamic> json) => Timeslot(
        startTime: json["start_time"],
        endTime: json["end_time"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
        "timezone": timezone,
      };
}

class Dimensions {
  double? weight;

  Dimensions({
    this.weight,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        weight: json["weight"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "weight": weight,
      };
}

class Item {
  String? itemDescription;
  int? quantity;

  Item({
    this.itemDescription,
    this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemDescription: json["item_description"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "item_description": itemDescription,
        "quantity": quantity,
      };
}

class Reference {
  String? merchantOrderNumber;

  Reference({
    this.merchantOrderNumber,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        merchantOrderNumber: json["merchant_order_number"],
      );

  Map<String, dynamic> toJson() => {
        "merchant_order_number": merchantOrderNumber,
      };
}

class Err {
  Error? error;

  Err({
    this.error,
  });

  factory Err.fromJson(Map<String, dynamic> json) => Err(
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error?.toJson(),
      };
}

class Error {
  String? requestId;
  String? title;
  String? message;

  Error({
    this.requestId,
    this.title,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        requestId: json["request_id"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "title": title,
        "message": message,
      };
}

class DeliveryAddressClass {
  String? address1;
  String? address2;
  String? area;
  String? city;
  String? country;
  String? postcode;
  String? state;
  int? cityId;
  int? regionId;
  int? countryId;

  DeliveryAddressClass({
    this.address1,
    this.address2,
    this.area,
    this.city,
    this.country,
    this.postcode,
    this.state,
    this.cityId,
    this.regionId,
    this.countryId,
  });

  factory DeliveryAddressClass.fromJson(Map<String, dynamic> json) =>
      DeliveryAddressClass(
        address1: json["address1"],
        address2: json["address2"],
        area: json["area"],
        city: json["city"],
        country: json["country"],
        postcode: json["postcode"],
        state: json["state"],
        cityId: json["cityId"],
        regionId: json["regionId"],
        countryId: json["countryId"],
      );

  Map<String, dynamic> toJson() => {
        "address1": address1,
        "address2": address2,
        "area": area,
        "city": city,
        "country": country,
        "postcode": postcode,
        "state": state,
        "cityId": cityId,
        "regionId": regionId,
        "countryId": countryId,
      };
}

class OrderItem {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  int? createdBy;
  DateTime? lastChangedDateTime;
  dynamic updatedBy;
  int? orderId;
  int? itemId;
  int? itemVariantId;
  int? quantity;
  int? pricePerUnit;
  int? discountAmount;
  int? tax;
  String? itemStatus;
  ItemInfo? itemInfo;
  Variant? variant;

  OrderItem({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.orderId,
    this.itemId,
    this.itemVariantId,
    this.quantity,
    this.pricePerUnit,
    this.discountAmount,
    this.tax,
    this.itemStatus,
    this.itemInfo,
    this.variant,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
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
        orderId: json["orderId"],
        itemId: json["itemId"],
        itemVariantId: json["itemVariantId"],
        quantity: json["quantity"],
        pricePerUnit: json["pricePerUnit"],
        discountAmount: json["discountAmount"],
        tax: json["tax"],
        itemStatus: json["itemStatus"],
        itemInfo: json["itemInfo"] == null
            ? null
            : ItemInfo.fromJson(json["itemInfo"]),
        variant:
            json["variant"] == null ? null : Variant.fromJson(json["variant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime?.toIso8601String(),
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "orderId": orderId,
        "itemId": itemId,
        "itemVariantId": itemVariantId,
        "quantity": quantity,
        "pricePerUnit": pricePerUnit,
        "discountAmount": discountAmount,
        "tax": tax,
        "itemStatus": itemStatus,
        "itemInfo": itemInfo?.toJson(),
        "variant": variant?.toJson(),
      };
}

class ItemInfo {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  dynamic createdBy;
  DateTime? lastChangedDateTime;
  dynamic updatedBy;
  String? name;
  String? coverPic;
  int? stocks;
  String? colorId;
  String? sizeId;

  ItemInfo({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.name,
    this.coverPic,
    this.stocks,
    this.colorId,
    this.sizeId,
  });

  factory ItemInfo.fromJson(Map<String, dynamic> json) => ItemInfo(
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
        coverPic: json["coverPic"],
        stocks: json["stocks"],
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
        "coverPic": coverPic,
        "stocks": stocks,
        "colorId": colorId,
        "sizeId": sizeId,
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
  String? name;
  dynamic seasonId;
  int? colorId;
  dynamic styleId;
  int? sizeId;
  int? sellingPrice;
  int? originalPrice;
  String? upc;
  List<String>? media;
  int? itemId;
  int? qty;
  int? backOrderQty;
  int? preOrderQty;
  dynamic season;
  ItemInfo? color;
  dynamic style;
  ItemInfo? size;

  Variant({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.name,
    this.seasonId,
    this.colorId,
    this.styleId,
    this.sizeId,
    this.sellingPrice,
    this.originalPrice,
    this.upc,
    this.media,
    this.itemId,
    this.qty,
    this.backOrderQty,
    this.preOrderQty,
    this.season,
    this.color,
    this.style,
    this.size,
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
        name: json["name"],
        seasonId: json["seasonId"],
        colorId: json["colorId"],
        styleId: json["styleId"],
        sizeId: json["sizeId"],
        sellingPrice: json["sellingPrice"],
        originalPrice: json["originalPrice"],
        upc: json["upc"],
        media: json["media"] == null
            ? []
            : List<String>.from(json["media"]!.map((x) => x)),
        itemId: json["itemId"],
        qty: json["qty"],
        backOrderQty: json["backOrderQty"],
        preOrderQty: json["preOrderQty"],
        season: json["season"],
        color: json["color"] == null ? null : ItemInfo.fromJson(json["color"]),
        style: json["style"],
        size: json["size"] == null ? null : ItemInfo.fromJson(json["size"]),
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
        "seasonId": seasonId,
        "colorId": colorId,
        "styleId": styleId,
        "sizeId": sizeId,
        "sellingPrice": sellingPrice,
        "originalPrice": originalPrice,
        "upc": upc,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
        "itemId": itemId,
        "qty": qty,
        "backOrderQty": backOrderQty,
        "preOrderQty": preOrderQty,
        "season": season,
        "color": color?.toJson(),
        "style": style,
        "size": size?.toJson(),
      };
}

class OrderStatusLog {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  dynamic createdBy;
  DateTime? lastChangedDateTime;
  dynamic updatedBy;
  int? orderId;
  String? status;
  bool? isCompleted;

  OrderStatusLog({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.orderId,
    this.status,
    this.isCompleted,
  });

  factory OrderStatusLog.fromJson(Map<String, dynamic> json) => OrderStatusLog(
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
        orderId: json["orderId"],
        status: json["status"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime?.toIso8601String(),
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "orderId": orderId,
        "status": status,
        "isCompleted": isCompleted,
      };
}

class UserInfo {
  int? id;
  bool? isActive;
  bool? isArchived;
  DateTime? createDateTime;
  dynamic createdBy;
  DateTime? lastChangedDateTime;
  dynamic updatedBy;
  String? email;
  String? firstName;
  String? lastName;
  String? mobileNo;
  int? storeId;
  int? role;
  String? countryCode;

  UserInfo({
    this.id,
    this.isActive,
    this.isArchived,
    this.createDateTime,
    this.createdBy,
    this.lastChangedDateTime,
    this.updatedBy,
    this.email,
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.storeId,
    this.role,
    this.countryCode,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
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
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileNo: json["mobileNo"],
        storeId: json["storeId"],
        role: json["role"],
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "isArchived": isArchived,
        "createDateTime": createDateTime?.toIso8601String(),
        "createdBy": createdBy,
        "lastChangedDateTime": lastChangedDateTime?.toIso8601String(),
        "updatedBy": updatedBy,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "mobileNo": mobileNo,
        "storeId": storeId,
        "role": role,
        "countryCode": countryCode,
      };
}

class PageInfo {
  int? pageNo;
  int? sizePerPage;
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
