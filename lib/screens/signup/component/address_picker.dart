import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tiger_loyalty/screens/signup/controller/signup_controller.dart';

class AddressPicker extends StatefulWidget {
  const AddressPicker({super.key});

  @override
  State<AddressPicker> createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  SignupController signupController = Get.find<SignupController>();
  GoogleMapController? mapController;
  TextEditingController searchController = TextEditingController();
  Set<Marker> markers = Set();
  Position? currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    try {
      currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {});
      print(
          "Latitude: ${currentLocation!.latitude}, Longitude: ${currentLocation!.longitude}");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "select_location_title".tr,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: /* Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              markers: markers,
              initialCameraPosition: const CameraPosition(
                target: LatLng(-6.814720, 39.289868),
                zoom: 12.0,
              ),
              onTap: _onMapTapped,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  if (signupController.locationName.value == "") {
                    Fluttertoast.showToast(msg: "select_location".tr);
                  } else {
                    signupController.isLocationSelected.value = true;
                    Get.back();
                  }
                },
                child: Container(
                  height: Get.height * 0.06,
                  width: Get.width * 0.6,
                  // padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Text(
                      "choose_location".tr,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ))
        ],
      ), */
      OpenStreetMapSearchAndPick(
                center: LatLong(-6.814720, 39.289868),
                buttonColor: Colors.blue,
                buttonText: 'Set Current Location',
                onPicked: (pickedData) {
                   signupController.locationName.value = pickedData.addressName;
                  signupController.isLocationSelected.value = true;
                    Get.back();
                })
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onMapTapped(LatLng latLng) async {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('Tapped Location'),
        position: latLng,
        infoWindow: const InfoWindow(title: 'Tapped Location'),
      ),
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      String locationName =
          "${placemark.name}, ${placemark.thoroughfare}, ${placemark.locality}";
      signupController.locationName.value = locationName;
      print("Selected Location Name: $locationName");
    }

    setState(() {
      mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
    });
  }

  void onSearchTextChanged(String query) async {
    List<Location> locations = await locationFromAddress(query);

    if (locations.isNotEmpty) {
      Location location = locations.first;
      mapController?.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(location.latitude, location.longitude),
        15.0,
      ));
    }
  }
}