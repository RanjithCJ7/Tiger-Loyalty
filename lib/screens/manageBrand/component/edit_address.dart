import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:tiger_loyalty/screens/manageBrand/controller/manage_brand_controller.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';

class EditAddressPicker extends StatefulWidget {
  const EditAddressPicker({super.key});

  @override
  State<EditAddressPicker> createState() => _AddressPickerState();
}

class _AddressPickerState extends State<EditAddressPicker> {
  ManagebrandController managebrandController =
      Get.find<ManagebrandController>();
  GoogleMapController? mapController;
  TextEditingController searchController = TextEditingController();
  Set<Marker> markers = {};
  Position? currentLocation;
  RxBool isLoading = false.obs;
  String tempLocation = "";

  @override
  void initState() {
    super.initState();
    tempLocation =
        managebrandController.profileController.profileModel.value.location ??
            "";
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    try {
      // isLoading(true);
      currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // _onMapTapped(
      //     LatLng(currentLocation!.latitude, currentLocation!.longitude));

      // setState(() {});
      // isLoading(false);
    } catch (e) {
      // isLoading(false);
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
        body: /*Obx(
        () => isLoading.value
            ? const LoaderWidget()
            : Stack(
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
                          if (managebrandController.locationName.value == "") {
                            Fluttertoast.showToast(msg: "select_location".tr);
                          } else {
                            managebrandController.isLocationSelected.value =
                                true;
                            managebrandController.locationName.value = tempLocation;
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
                              border:
                                  Border.all(color: Colors.black, width: 2)),
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
              ),
      ),*/
            OpenStreetMapSearchAndPick(
                center: LatLong(-6.814720, 39.289868),
                buttonColor: Colors.blue,
                buttonText: 'Set Current Location',
                onPicked: (pickedData) {
                  print(pickedData.latLong.latitude);
                  print(pickedData.latLong.longitude);
                  print(pickedData.addressName);
                  managebrandController.isLocationSelected.value = true;
                  managebrandController.locationName.value =
                      pickedData.addressName;
                  Get.back();
                }));
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
      tempLocation = locationName;
      // managebrandController.locationName.value = locationName;
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
