import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class LocationPickerHelper {
  final BuildContext context;
  final GeoPoint? initialLocation;
  final MapController mapController;
  final ValueNotifier<GeoPoint?> selectedLocation;
  final ValueNotifier<bool> isMapReady;
  final ValueNotifier<bool> isInitialized;

  LocationPickerHelper({
    required this.context,
    required this.initialLocation,
    required this.mapController,
    required this.selectedLocation,
    required this.isMapReady,
    required this.isInitialized,
  });

  Future<void> initializeMap() async {
    if (isInitialized.value) return;
    try {
      // Wait for map to be ready
      await Future.delayed(const Duration(milliseconds: 1000));

      // Always use the initial location if provided, never get current location
      if (initialLocation != null) {
        selectedLocation.value = initialLocation;
        await mapController.setZoom(zoomLevel: 15);
        await mapController.moveTo(initialLocation!);
      } else {
        // Only if no initial location is provided, use a default location
        // But don't get current location to avoid sudden jumps
        final defaultLocation = GeoPoint(latitude: 0.0, longitude: 0.0);
        selectedLocation.value = defaultLocation;
        await mapController.setZoom(zoomLevel: 15);
        await mapController.moveTo(defaultLocation);
      }

      isMapReady.value = true;
      isInitialized.value = true;
    } catch (e) {
      debugPrint('Error in _initializeMap: $e');
      isMapReady.value = true;
      isInitialized.value = true;
    }
  }

  Future<GeoPoint?> getCurrentLocation() async {
    try {
      return await mapController.myLocation();
    } catch (e) {
      debugPrint("Error getting current location: $e");
      return null;
    }
  }

  void confirmLocation() async {
    final center = await mapController.centerMap;
    if (!context.mounted) return;
    Navigator.of(context).pop(center);
  }

  void useCurrentLocation() async {
    try {
      isMapReady.value = false;

      final currentLocation = await getCurrentLocation();
      if (currentLocation != null) {
        await mapController.moveTo(currentLocation);
        selectedLocation.value = currentLocation;
      }

      isMapReady.value = true;
    } catch (e) {
      debugPrint("Error using current location: $e");
      isMapReady.value = true;
    }
  }

  Future<void> onMapMoved() async {
    final center = await mapController.centerMap;
    selectedLocation.value = center;
  }
}
