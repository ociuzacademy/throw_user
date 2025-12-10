import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:throw_user/modules/delivery_request_module/utils/location_card_preview_helper.dart';

class LocationCardPreview extends StatefulWidget {
  const LocationCardPreview({
    super.key,
    required this.isDark,
    required this.isPickup,
    required this.selectedLocation,
  });

  final bool isDark;
  final bool isPickup;
  final GeoPoint? selectedLocation;

  @override
  State<LocationCardPreview> createState() => _LocationCardPreviewState();
}

class _LocationCardPreviewState extends State<LocationCardPreview> {
  late final LocationCardPreviewHelper _locationCardPreviewHelper;
  late MapController _mapController;
  final ValueNotifier<bool> _isMapReady = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    // Create a simple controller without any user tracking
    _mapController = MapController(
      initPosition:
          widget.selectedLocation ?? GeoPoint(latitude: 0.0, longitude: 0.0),
    );

    _locationCardPreviewHelper = LocationCardPreviewHelper(
      mapController: _mapController,
      isMapReady: _isMapReady,
      selectedLocation: widget.selectedLocation,
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    _isMapReady.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isMapReady,
      builder: (context, isMapReady, child) {
        return Stack(
          children: [
            // Static map preview
            OSMFlutter(
              controller: _mapController,
              osmOption: OSMOption(
                // Disable all user location features
                userTrackingOption: const UserTrackingOption(
                  enableTracking: false,
                  unFollowUser: true,
                ),
                // Provide required markers but make them transparent
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_history,
                      color: Colors.transparent,
                      size: 1,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.double_arrow,
                      color: Colors.transparent,
                      size: 1,
                    ),
                  ),
                ),
                zoomOption: const ZoomOption(
                  initZoom:
                      15, // Set initial zoom here instead of programmatically
                  minZoomLevel: 15,
                  maxZoomLevel: 15,
                  stepZoom: 1.0,
                ),
                staticPoints: [
                  StaticPositionGeoPoint(
                    "marker",
                    MarkerIcon(
                      icon: Icon(
                        Icons.location_pin,
                        color: widget.isPickup ? Colors.red : Colors.green,
                        size: 48,
                      ),
                    ),
                    [
                      widget.selectedLocation ??
                          GeoPoint(latitude: 0.0, longitude: 0.0),
                    ],
                  ),
                ],
                showDefaultInfoWindow: false,
              ),
              onMapIsReady: _locationCardPreviewHelper.onMapReady,
            ),

            // Overlay to prevent interaction
            Container(color: Colors.transparent),

            // Loading indicator or location info overlay
            if (!isMapReady)
              Container(
                color: widget.isDark
                    ? AppColors.borderDark
                    : AppColors.backgroundLight,
                child: const Center(child: CircularProgressIndicator()),
              )
            else
              Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 178),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 32,
                        color: widget.isPickup ? Colors.red : Colors.green,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${widget.selectedLocation!.latitude.toStringAsFixed(4)},\n${widget.selectedLocation!.longitude.toStringAsFixed(4)}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
