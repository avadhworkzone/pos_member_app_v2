class TransactionListResponse {
  int? totalPoints;
  int? redeemPoints;
  int? availablePoints;
  List<LoyaltyPoints>? loyaltyPoints;
  int? totalRecords;
  int? lastPage;
  int? currentPage;
  int? perPage;

  TransactionListResponse(
      {this.totalPoints,
      this.redeemPoints,
      this.availablePoints,
      this.loyaltyPoints,
      this.totalRecords,
      this.lastPage,
      this.currentPage,
      this.perPage});

  TransactionListResponse.fromJson(Map<String, dynamic> json) {
    totalPoints = json['total_points'];
    redeemPoints = json['redeem_points'];
    availablePoints = json['available_points'];
    if (json['loyalty_points'] != null) {
      loyaltyPoints = <LoyaltyPoints>[];
      json['loyalty_points'].forEach((v) {
        loyaltyPoints!.add(new LoyaltyPoints.fromJson(v));
      });
    }
    totalRecords = json['total_records'];
    lastPage = json['last_page'];
    currentPage = json['current_page'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_points'] = this.totalPoints;
    data['redeem_points'] = this.redeemPoints;
    data['available_points'] = this.availablePoints;
    if (this.loyaltyPoints != null) {
      data['loyalty_points'] =
          this.loyaltyPoints!.map((v) => v.toJson()).toList();
    }
    data['total_records'] = this.totalRecords;
    data['last_page'] = this.lastPage;
    data['current_page'] = this.currentPage;
    data['per_page'] = this.perPage;
    return data;
  }
}

class LoyaltyPoints {
  int? points;
  int? closingLoyaltyPointsBalance;
  String? typeId;
  String? affectedByType;
  String? happenedAt;
  String? type;

  LoyaltyPoints(
      {this.points,
      this.closingLoyaltyPointsBalance,
      this.typeId,
      this.affectedByType,
      this.happenedAt,
      this.type});

  LoyaltyPoints.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    closingLoyaltyPointsBalance = json['closing_loyalty_points_balance'];
    typeId = json['type_id'];
    affectedByType = json['affected_by_type'];
    happenedAt = json['happened_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['points'] = this.points;
    data['closing_loyalty_points_balance'] = this.closingLoyaltyPointsBalance;
    data['type_id'] = this.typeId;
    data['affected_by_type'] = this.affectedByType;
    data['happened_at'] = this.happenedAt;
    data['type'] = this.type;
    return data;
  }
}
