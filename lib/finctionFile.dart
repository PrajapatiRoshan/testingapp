// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.status,
    required this.message,
    required this.errorCode,
    required this.filterData,
  });

  String status;
  String message;
  String errorCode;
  List<FilterDatum> filterData;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    message: json["message"],
    errorCode: json["errorCode"],
    filterData: List<FilterDatum>.from(json["filterData"].map((x) => FilterDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "errorCode": errorCode,
    "filterData": List<dynamic>.from(filterData.map((x) => x.toJson())),
  };
}

class FilterDatum {
  FilterDatum({
    required this.cif,
    required this.companyName,
    required this.hierarchy,
  });

  String cif;
  String companyName;
  List<Hierarchy> hierarchy;

  factory FilterDatum.fromJson(Map<String, dynamic> json) => FilterDatum(
    cif: json["Cif"],
    companyName: json["companyName"],
    hierarchy: List<Hierarchy>.from(json["hierarchy"].map((x) => Hierarchy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Cif": cif,
    "companyName": companyName,
    "hierarchy": List<dynamic>.from(hierarchy.map((x) => x.toJson())),
  };
}

class Hierarchy {
  Hierarchy({
    required this.accountNumber,
    required this.brandNameList,
  });

  String accountNumber;
  List<BrandNameList> brandNameList;

  factory Hierarchy.fromJson(Map<String, dynamic> json) => Hierarchy(
    accountNumber: json["accountNumber"],
    brandNameList: List<BrandNameList>.from(json["brandNameList"].map((x) => BrandNameList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "accountNumber": accountNumber,
    "brandNameList": List<dynamic>.from(brandNameList.map((x) => x.toJson())),
  };
}

class BrandNameList {
  BrandNameList({
    required this.brandName,
    required this.locationNameList,
  });

  String brandName;
  List<LocationNameList> locationNameList;

  factory BrandNameList.fromJson(Map<String, dynamic> json) => BrandNameList(
    brandName: json["brandName"],
    locationNameList: List<LocationNameList>.from(json["locationNameList"].map((x) => LocationNameList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "brandName": brandName,
    "locationNameList": List<dynamic>.from(locationNameList.map((x) => x.toJson())),
  };
}

class LocationNameList {
  LocationNameList({
    required this.locationName,
    required this.merchantNumber,
  });

  String locationName;
  List<MerchantNumber> merchantNumber;

  factory LocationNameList.fromJson(Map<String, dynamic> json) => LocationNameList(
    locationName: json["locationName"],
    merchantNumber: List<MerchantNumber>.from(json["merchantNumber"].map((x) => MerchantNumber.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "locationName": locationName,
    "merchantNumber": List<dynamic>.from(merchantNumber.map((x) => x.toJson())),
  };
}

class MerchantNumber {
  MerchantNumber({
    required this.mid,
    required this.outletNumber,
  });

  String mid;
  List<String> outletNumber;

  factory MerchantNumber.fromJson(Map<String, dynamic> json) => MerchantNumber(
    mid: json["mid"],
    outletNumber: List<String>.from(json["outletNumber"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "mid": mid,
    "outletNumber": List<dynamic>.from(outletNumber.map((x) => x)),
  };
}
