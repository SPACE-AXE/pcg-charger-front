import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
//{"id":1,"name":"금오공과대학교",
//"phone":"0544780000","address":"구미시 대학로",
//"totalSpace":10,"carSpace":5,"disabilitySpace":5,
//"ip":"58.227.149.61"}
class ParkData extends ChangeNotifier {
  int? id;
  IO.Socket? socket;
  String? name;
  String? phone;
  String? address;
  int? totalSpace;
  int? carSpace;
  int? disabilitySpace;
  String? ip;

  ParkData({
    this.id,
    this.socket,
    this.name,
    this.phone,
    this.address,
    this.totalSpace,
    this.carSpace,
    this.disabilitySpace,
    this.ip,
  });

  factory ParkData.fromJson(Map<String, dynamic> data) {
    return ParkData(
      id: data['id'],
      name: data['name'],
      phone: data['phone'],
      address: data['address'],
      totalSpace: data['totalSpace'],
      carSpace: data['carSpace'],
      disabilitySpace: data['disabilitySpace'],
      ip: data['ip'] 
    );
  }
  void updateParkData(ParkData data) {
    id = data.id;
    name = data.name;
    phone = data.phone;
    address = data.address;
    totalSpace = data.totalSpace;
    carSpace = data.carSpace;
    disabilitySpace = data.disabilitySpace;
    ip = data.ip;
    notifyListeners();
  }
  void updateSocket(IO.Socket io) {
    socket = io;
    notifyListeners();
  }
}

final parkDataProvider = ChangeNotifierProvider<ParkData>((ref) {
  return ParkData();
});
