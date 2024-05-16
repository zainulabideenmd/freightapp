// To parse this JSON data, do
//
//     final freightListModel = freightListModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'freight_list_model.g.dart';

FreightListModel freightListModelFromJson(String str) => FreightListModel.fromJson(json.decode(str));

String freightListModelToJson(FreightListModel data) => json.encode(data.toJson());

@JsonSerializable()
class FreightListModel {
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "method")
  String? method;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "data")
  Data? data;

  FreightListModel({
    this.path,
    this.method,
    this.statusCode,
    this.data,
  });

  factory FreightListModel.fromJson(Map<String, dynamic> json) => _$FreightListModelFromJson(json);

  Map<String, dynamic> toJson() => _$FreightListModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "result")
  Result? result;

  Data({
    this.success,
    this.result,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "data")
  List<Datum>? data;

  Result({
    this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "currentStatus")
  String? currentStatus;
  @JsonKey(name: "GpsProvider")
  GpsProvider? gpsProvider;
  @JsonKey(name: "BookingID")
  String? bookingId;
  @JsonKey(name: "Market/Regular ")
  MarketRegular? marketRegular;
  @JsonKey(name: "BookingID_Date")
  String? bookingIdDate;
  @JsonKey(name: "vehicle_no")
  String? vehicleNo;
  @JsonKey(name: "Origin_Location")
  String? originLocation;
  @JsonKey(name: "Destination_Location")
  String? datumDestinationLocation;
  @JsonKey(name: "Org_lat_lon")
  String? orgLatLon;
  @JsonKey(name: "Des_lat_lon")
  String? desLatLon;
  @JsonKey(name: "Data_Ping_time")
  String? dataPingTime;
  @JsonKey(name: "Planned_ETA")
  String? plannedEta;
  @JsonKey(name: "Current_Location")
  String? currentLocation;
  @JsonKey(name: "DestinationLocation")
  String? destinationLocation;
  @JsonKey(name: "actual_eta")
  String? actualEta;
  @JsonKey(name: "Curr_lat")
  String? currLat;
  @JsonKey(name: "Curr_lon")
  String? currLon;
  @JsonKey(name: "ontime")
  MinimumKmsToBeCoveredInADay? ontime;
  @JsonKey(name: "delay")
  Delay? delay;
  @JsonKey(name: "OriginLocation_Code")
  String? originLocationCode;
  @JsonKey(name: "DestinationLocation_Code")
  String? destinationLocationCode;
  @JsonKey(name: "trip_start_date")
  String? tripStartDate;
  @JsonKey(name: "trip_end_date")
  MinimumKmsToBeCoveredInADay? tripEndDate;
  @JsonKey(name: "TRANSPORTATION_DISTANCE_IN_KM")
  String? transportationDistanceInKm;
  @JsonKey(name: "vehicleType")
  MinimumKmsToBeCoveredInADay? vehicleType;
  @JsonKey(name: "Minimum_kms_to_be_covered_in_a_day")
  MinimumKmsToBeCoveredInADay? minimumKmsToBeCoveredInADay;
  @JsonKey(name: "Driver_Name")
  String? driverName;
  @JsonKey(name: "Driver_MobileNo")
  DriverMobileNo? driverMobileNo;
  @JsonKey(name: "customerID")
  CustomerId? customerId;
  @JsonKey(name: "customerNameCode")
  CustomerNameCode? customerNameCode;
  @JsonKey(name: "supplierID")
  String? supplierId;
  @JsonKey(name: "supplierNameCode")
  String? supplierNameCode;
  @JsonKey(name: "Material Shipped")
  String? materialShipped;
  @JsonKey(name: "imagePath")
  String? imagePath;

  Datum({
    this.currentStatus,
    this.gpsProvider,
    this.bookingId,
    this.marketRegular,
    this.bookingIdDate,
    this.vehicleNo,
    this.originLocation,
    this.datumDestinationLocation,
    this.orgLatLon,
    this.desLatLon,
    this.dataPingTime,
    this.plannedEta,
    this.currentLocation,
    this.destinationLocation,
    this.actualEta,
    this.currLat,
    this.currLon,
    this.ontime,
    this.delay,
    this.originLocationCode,
    this.destinationLocationCode,
    this.tripStartDate,
    this.tripEndDate,
    this.transportationDistanceInKm,
    this.vehicleType,
    this.minimumKmsToBeCoveredInADay,
    this.driverName,
    this.driverMobileNo,
    this.customerId,
    this.customerNameCode,
    this.supplierId,
    this.supplierNameCode,
    this.materialShipped,
    this.imagePath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

enum CustomerId {
  @JsonValue("ALLEXCHE45")
  ALLEXCHE45,
  @JsonValue("DMREXCHEUX")
  DMREXCHEUX,
  @JsonValue("LUTGCCHE06")
  LUTGCCHE06
}

final customerIdValues = EnumValues({
  "ALLEXCHE45": CustomerId.ALLEXCHE45,
  "DMREXCHEUX": CustomerId.DMREXCHEUX,
  "LUTGCCHE06": CustomerId.LUTGCCHE06
});

enum CustomerNameCode {
  @JsonValue("Ashok leyland limited")
  ASHOK_LEYLAND_LIMITED,
  @JsonValue("Daimler india commercial vehicles pvt lt")
  DAIMLER_INDIA_COMMERCIAL_VEHICLES_PVT_LT,
  @JsonValue("Lucas tvs ltd")
  LUCAS_TVS_LTD
}

final customerNameCodeValues = EnumValues({
  "Ashok leyland limited": CustomerNameCode.ASHOK_LEYLAND_LIMITED,
  "Daimler india commercial vehicles pvt lt": CustomerNameCode.DAIMLER_INDIA_COMMERCIAL_VEHICLES_PVT_LT,
  "Lucas tvs ltd": CustomerNameCode.LUCAS_TVS_LTD
});

enum Delay {
  @JsonValue("NULL")
  NULL,
  @JsonValue("R")
  R
}

final delayValues = EnumValues({
  "NULL": Delay.NULL,
  "R": Delay.R
});

enum DriverMobileNo {
  @JsonValue("NA")
  NA
}

final driverMobileNoValues = EnumValues({
  "NA": DriverMobileNo.NA
});

enum GpsProvider {
  @JsonValue("CONSENT TRACK")
  CONSENT_TRACK,
  @JsonValue("VAMOSYS")
  VAMOSYS
}

final gpsProviderValues = EnumValues({
  "CONSENT TRACK": GpsProvider.CONSENT_TRACK,
  "VAMOSYS": GpsProvider.VAMOSYS
});

enum MarketRegular {
  @JsonValue("Market")
  MARKET,
  @JsonValue("Regular")
  REGULAR
}

final marketRegularValues = EnumValues({
  "Market": MarketRegular.MARKET,
  "Regular": MarketRegular.REGULAR
});

enum MinimumKmsToBeCoveredInADay {
  @JsonValue("G")
  G,
  @JsonValue("NULL")
  NULL
}

final minimumKmsToBeCoveredInADayValues = EnumValues({
  "G": MinimumKmsToBeCoveredInADay.G,
  "NULL": MinimumKmsToBeCoveredInADay.NULL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
