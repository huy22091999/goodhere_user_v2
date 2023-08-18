import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class ProductRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ProductRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAllProduct({required int pageIndex, required int pageSize}) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    double latitude = 0.0;
    double longitude = 0.0;
    await _getCurrentLocation().then((value) => {
      latitude = value.latitude,
      longitude = value.longitude,
    });
    Map<String,String> query = {
      "pageIndex" : "$pageIndex",
      "pageSize" : "$pageSize",
      "latitude" : "$latitude",
      "longitude" : "$longitude",
    };
    return apiClient.getData(AppConstants.GET_PRODUCTS,query: query);
  }
}
Future<LatLng> _getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  double latitude = position.latitude;
  double longitude = position.longitude;
  return LatLng(latitude, longitude);
}