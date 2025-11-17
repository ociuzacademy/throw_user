// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class LocationCardPreviewHelper {
  final GeoPoint? selectedLocation;
  final MapController mapController;
  final ValueNotifier<bool> isMapReady;
  const LocationCardPreviewHelper({
    this.selectedLocation,
    required this.mapController,
    required this.isMapReady,
  });

  Future<void> onMapReady(bool isReady) async {
    if (isReady && !isMapReady.value) {
      try {
        debugPrint("Static map ready for: $selectedLocation");

        // Now that the map is ready, we can set the zoom
        if (selectedLocation != null) {
          await mapController.setZoom(zoomLevel: 15);
        }

        isMapReady.value = true;
      } catch (e) {
        debugPrint('Error setting zoom on static map: $e');
        isMapReady.value = true;
      }
    }
  }
}
