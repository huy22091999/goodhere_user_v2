import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({required this.apiClient, required this.sharedPreferences});

  // Future<Response> getAllAddress() async {
  //   return await apiClient.getData(AppConstants.ADDRESS_LIST_URI);
  // }

  // Future<Response> getZone(String lat, String lng) async {
  //   return await apiClient.getData(
  //       '${AppConstants.ZONE_URI}?lat=$lat&lng=$lng');
  // }
  //
  // Future<Response> removeAddressByID(int id) async {
  //   return await apiClient.postData(
  //       '${AppConstants.REMOVE_ADDRESS_URI}$id', {"_method": "delete"});
  // }
  //
  // Future<Response> addAddress(AddressModel addressModel) async {
  //   return await apiClient.postData(
  //       AppConstants.ADD_ADDRESS_URI, addressModel.toJson(),);
  // }
  //
  // Future<Response> updateAddress(AddressModel addressModel, int addressId) async {
  //   return await apiClient.putData(
  //       '${AppConstants.UPDATE_ADDRESS_URI}$addressId',
  //       addressModel.toJson(),
  //       null);
  // }

  // Future<bool> saveUserAddress(String address, List<int> zoneIDs) async {
  //   print('---------$address/${zoneIDs.toString()}');
  //   apiClient.updateHeader(
  //     sharedPreferences.getString(AppConstants.TOKEN),
  //     zoneIDs,
  //     sharedPreferences.getString(AppConstants.LANGUAGE_CODE),
  //     Get.find<SplashController>().module != null
  //         ? Get.find<SplashController>().module!.id
  //         : null,
  //   );
  //   return await sharedPreferences.setString(AppConstants.USER_ADDRESS, address);
  // }

  // Future<Response> getAddressFromGeocode(LatLng latLng) async {
  //   return await apiClient.getData(
  //       '${AppConstants.}?lat=${latLng.latitude}&lng=${latLng.longitude}',);
  // }

  String? getUserAddress() {
    return sharedPreferences.getString(AppConstants.USER_ADDRESS);
  }


}
