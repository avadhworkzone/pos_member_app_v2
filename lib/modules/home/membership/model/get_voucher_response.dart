class GetVoucherResponseModel {
  List<Vouchers>? vouchers;
  int? totalRecords;
  int? lastPage;
  int? currentPage;
  int? perPage;

  GetVoucherResponseModel(
      {this.vouchers,
      this.totalRecords,
      this.lastPage,
      this.currentPage,
      this.perPage});

  GetVoucherResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['vouchers'] != null) {
      vouchers = <Vouchers>[];
      json['vouchers'].forEach((v) {
        vouchers!.add(new Vouchers.fromJson(v));
      });
    }
    totalRecords = json['total_records'];
    lastPage = json['last_page'];
    currentPage = json['current_page'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vouchers != null) {
      data['vouchers'] = this.vouchers!.map((v) => v.toJson()).toList();
    }
    data['total_records'] = this.totalRecords;
    data['last_page'] = this.lastPage;
    data['current_page'] = this.currentPage;
    data['per_page'] = this.perPage;
    return data;
  }
}

class Vouchers {
  int? id;
  int? createdByStoreId;
  String? discountType;
  String? number;
  String? minimumSpendAmount;
  String? percentage;
  String? flatAmount;
  var usedAt;
  String? expiryDate;
  List<Transactions>? transactions;

  Vouchers(
      {this.id,
      this.createdByStoreId,
      this.discountType,
      this.number,
      this.minimumSpendAmount,
      this.percentage,
      this.flatAmount,
      this.usedAt,
      this.expiryDate,
      this.transactions});

  Vouchers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdByStoreId = json['created_by_store_id'];
    discountType = json['discount_type'];
    number = json['number'];
    minimumSpendAmount = json['minimum_spend_amount'];
    percentage = json['percentage'];
    flatAmount = json['flat_amount'];
    usedAt = json['used_at'];
    expiryDate = json['expiry_date'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_by_store_id'] = this.createdByStoreId;
    data['discount_type'] = this.discountType;
    data['number'] = this.number;
    data['minimum_spend_amount'] = this.minimumSpendAmount;
    data['percentage'] = this.percentage;
    data['flat_amount'] = this.flatAmount;
    data['used_at'] = this.usedAt;
    data['expiry_date'] = this.expiryDate;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? offlineSaleId;
  String? actionType;
  String? store;
  String? date;

  Transactions({this.offlineSaleId, this.actionType, this.store, this.date});

  Transactions.fromJson(Map<String, dynamic> json) {
    offlineSaleId = json['offline_sale_id'];
    actionType = json['action_type'];
    store = json['store'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offline_sale_id'] = this.offlineSaleId;
    data['action_type'] = this.actionType;
    data['store'] = this.store;
    data['date'] = this.date;
    return data;
  }
}
