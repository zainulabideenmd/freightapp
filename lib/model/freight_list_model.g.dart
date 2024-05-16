// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freight_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreightListModel _$FreightListModelFromJson(Map<String, dynamic> json) =>
    FreightListModel(
      path: json['path'] as String?,
      method: json['method'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FreightListModelToJson(FreightListModel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'method': instance.method,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      success: json['success'] as bool?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      currentStatus: json['currentStatus'] as String?,
      gpsProvider:
          $enumDecodeNullable(_$GpsProviderEnumMap, json['GpsProvider']),
      bookingId: json['BookingID'] as String?,
      marketRegular:
          $enumDecodeNullable(_$MarketRegularEnumMap, json['Market/Regular ']),
      bookingIdDate: json['BookingID_Date'] as String?,
      vehicleNo: json['vehicle_no'] as String?,
      originLocation: json['Origin_Location'] as String?,
      datumDestinationLocation: json['Destination_Location'] as String?,
      orgLatLon: json['Org_lat_lon'] as String?,
      desLatLon: json['Des_lat_lon'] as String?,
      dataPingTime: json['Data_Ping_time'] as String?,
      plannedEta: json['Planned_ETA'] as String?,
      currentLocation: json['Current_Location'] as String?,
      destinationLocation: json['DestinationLocation'] as String?,
      actualEta: json['actual_eta'] as String?,
      currLat: json['Curr_lat'] as String?,
      currLon: json['Curr_lon'] as String?,
      ontime: $enumDecodeNullable(
          _$MinimumKmsToBeCoveredInADayEnumMap, json['ontime']),
      delay: $enumDecodeNullable(_$DelayEnumMap, json['delay']),
      originLocationCode: json['OriginLocation_Code'] as String?,
      destinationLocationCode: json['DestinationLocation_Code'] as String?,
      tripStartDate: json['trip_start_date'] as String?,
      tripEndDate: $enumDecodeNullable(
          _$MinimumKmsToBeCoveredInADayEnumMap, json['trip_end_date']),
      transportationDistanceInKm:
          json['TRANSPORTATION_DISTANCE_IN_KM'] as String?,
      vehicleType: $enumDecodeNullable(
          _$MinimumKmsToBeCoveredInADayEnumMap, json['vehicleType']),
      minimumKmsToBeCoveredInADay: $enumDecodeNullable(
          _$MinimumKmsToBeCoveredInADayEnumMap,
          json['Minimum_kms_to_be_covered_in_a_day']),
      driverName: json['Driver_Name'] as String?,
      driverMobileNo:
          $enumDecodeNullable(_$DriverMobileNoEnumMap, json['Driver_MobileNo']),
      customerId: $enumDecodeNullable(_$CustomerIdEnumMap, json['customerID']),
      customerNameCode: $enumDecodeNullable(
          _$CustomerNameCodeEnumMap, json['customerNameCode']),
      supplierId: json['supplierID'] as String?,
      supplierNameCode: json['supplierNameCode'] as String?,
      materialShipped: json['Material Shipped'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'currentStatus': instance.currentStatus,
      'GpsProvider': _$GpsProviderEnumMap[instance.gpsProvider],
      'BookingID': instance.bookingId,
      'Market/Regular ': _$MarketRegularEnumMap[instance.marketRegular],
      'BookingID_Date': instance.bookingIdDate,
      'vehicle_no': instance.vehicleNo,
      'Origin_Location': instance.originLocation,
      'Destination_Location': instance.datumDestinationLocation,
      'Org_lat_lon': instance.orgLatLon,
      'Des_lat_lon': instance.desLatLon,
      'Data_Ping_time': instance.dataPingTime,
      'Planned_ETA': instance.plannedEta,
      'Current_Location': instance.currentLocation,
      'DestinationLocation': instance.destinationLocation,
      'actual_eta': instance.actualEta,
      'Curr_lat': instance.currLat,
      'Curr_lon': instance.currLon,
      'ontime': _$MinimumKmsToBeCoveredInADayEnumMap[instance.ontime],
      'delay': _$DelayEnumMap[instance.delay],
      'OriginLocation_Code': instance.originLocationCode,
      'DestinationLocation_Code': instance.destinationLocationCode,
      'trip_start_date': instance.tripStartDate,
      'trip_end_date':
          _$MinimumKmsToBeCoveredInADayEnumMap[instance.tripEndDate],
      'TRANSPORTATION_DISTANCE_IN_KM': instance.transportationDistanceInKm,
      'vehicleType': _$MinimumKmsToBeCoveredInADayEnumMap[instance.vehicleType],
      'Minimum_kms_to_be_covered_in_a_day':
          _$MinimumKmsToBeCoveredInADayEnumMap[
              instance.minimumKmsToBeCoveredInADay],
      'Driver_Name': instance.driverName,
      'Driver_MobileNo': _$DriverMobileNoEnumMap[instance.driverMobileNo],
      'customerID': _$CustomerIdEnumMap[instance.customerId],
      'customerNameCode': _$CustomerNameCodeEnumMap[instance.customerNameCode],
      'supplierID': instance.supplierId,
      'supplierNameCode': instance.supplierNameCode,
      'Material Shipped': instance.materialShipped,
      'imagePath': instance.imagePath,
    };

const _$GpsProviderEnumMap = {
  GpsProvider.CONSENT_TRACK: 'CONSENT TRACK',
  GpsProvider.VAMOSYS: 'VAMOSYS',
};

const _$MarketRegularEnumMap = {
  MarketRegular.MARKET: 'Market',
  MarketRegular.REGULAR: 'Regular',
};

const _$MinimumKmsToBeCoveredInADayEnumMap = {
  MinimumKmsToBeCoveredInADay.G: 'G',
  MinimumKmsToBeCoveredInADay.NULL: 'NULL',
};

const _$DelayEnumMap = {
  Delay.NULL: 'NULL',
  Delay.R: 'R',
};

const _$DriverMobileNoEnumMap = {
  DriverMobileNo.NA: 'NA',
};

const _$CustomerIdEnumMap = {
  CustomerId.ALLEXCHE45: 'ALLEXCHE45',
  CustomerId.DMREXCHEUX: 'DMREXCHEUX',
  CustomerId.LUTGCCHE06: 'LUTGCCHE06',
};

const _$CustomerNameCodeEnumMap = {
  CustomerNameCode.ASHOK_LEYLAND_LIMITED: 'Ashok leyland limited',
  CustomerNameCode.DAIMLER_INDIA_COMMERCIAL_VEHICLES_PVT_LT:
      'Daimler india commercial vehicles pvt lt',
  CustomerNameCode.LUCAS_TVS_LTD: 'Lucas tvs ltd',
};
