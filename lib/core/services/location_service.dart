import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  CustomPosition? position;
  Completer<CustomPosition>? _completer;
  Future<CustomPosition> getCurrentLocation([bool getAddress = true]) async {
    if (_completer != null) {
      return _completer!.future;
    } else {
      _completer = Completer<CustomPosition>();
    }
    final status = await Geolocator.requestPermission();
    if (status == LocationPermission.whileInUse || status == LocationPermission.always) {
      position = CustomPosition(
        status: status,
        msg: "",
        success: true,
        position: await Geolocator.getCurrentPosition(),
      );
      if (position?.position != null) {
        final address = await getAddressFromLatLng(position: position!.position!);
        position = position?.copyWith(address: address);
      }
      _completer!.complete(position);
      return position!;
    } else if (status == LocationPermission.denied) {
      final status = await Geolocator.requestPermission();
      if (status == LocationPermission.whileInUse || status == LocationPermission.always) {
        position = CustomPosition(
          status: status,
          msg: "",
          success: true,
          position: await Geolocator.getCurrentPosition(),
        );
        if (position?.position != null) {
          final address = await getAddressFromLatLng(position: position!.position!);
          position = position?.copyWith(address: address);
        }
        _completer!.complete(position);
        return position!;
      } else {
        position = CustomPosition(
          status: status,
          msg: "Location permission is permanently denied",
          success: false,
        );
        _completer!.complete(position);
        return position!;
      }
    } else {
      position = CustomPosition(
        status: status,
        msg: "Location permission is $status",
        success: false,
      );
      if (position?.position != null && getAddress) {
        final address = await getAddressFromLatLng(position: position!.position!);
        position = position?.copyWith(address: address);
      }
      _completer!.complete(position);
      return position!;
    }
  }

  Future<String> getAddressFromLatLng({Position? position, latLng}) async {
    try {
      double lat, lng;
      if (position == null && latLng == null) {
        throw "you position or latLng mustn't be null";
      } else {
        lat = position?.latitude ?? latLng!.latitude;
        lng = position?.longitude ?? latLng!.longitude;
      }
      await setLocaleIdentifier("ar_EG");
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        log(jsonEncode(placemark.toJson()));
        return [
          placemark.street,
          placemark.subLocality,
          placemark.subAdministrativeArea ?? placemark.locality,
          placemark.administrativeArea,
          placemark.country,
        ].where((e) => e?.isNotEmpty ?? false).join(", ");
      } else {
        return "";
      }
    } catch (e) {
      log("$e");
      return "";
    }
  }
}

class CustomPosition {
  final Position? position;
  final String msg;
  final bool success;
  final LocationPermission status;
  final String? address;

  CustomPosition({
    this.address,
    required this.status,
    this.position,
    required this.msg,
    required this.success,
  });

  CustomPosition copyWith({
    Position? position,
    String? msg,
    bool? success,
    LocationPermission? status,
    String? address,
  }) {
    return CustomPosition(
      address: address ?? this.address,
      position: position ?? this.position,
      msg: msg ?? this.msg,
      success: success ?? this.success,
      status: status ?? this.status,
    );
  }
}
