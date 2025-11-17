import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:throw_user/modules/location_picker_module/utils/location_picker_helper.dart';

class LocationPickerPage extends StatefulWidget {
  final String title;
  final GeoPoint? initialLocation;
  final bool isPickup;

  const LocationPickerPage({
    super.key,
    required this.title,
    this.initialLocation,
    required this.isPickup,
  });

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();

  static Future<GeoPoint?> navigate(
    BuildContext context, {
    required String title,
    required bool isPickup,
    GeoPoint? initialLocation,
  }) async {
    return await Navigator.of(context).push<GeoPoint?>(
      MaterialPageRoute(
        builder: (context) => LocationPickerPage(
          title: title,
          initialLocation: initialLocation,
          isPickup: isPickup,
        ),
      ),
    );
  }
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  late final LocationPickerHelper _locationPickerHelper;
  late MapController _mapController;
  final ValueNotifier<GeoPoint?> _selectedLocation = ValueNotifier<GeoPoint?>(
    null,
  );
  final ValueNotifier<bool> _isMapReady = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isInitialized = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _mapController = MapController(
      initPosition:
          widget.initialLocation ?? GeoPoint(latitude: 0.0, longitude: 0.0),
    );

    _locationPickerHelper = LocationPickerHelper(
      context: context,
      initialLocation: widget.initialLocation,
      mapController: _mapController,
      selectedLocation: _selectedLocation,
      isMapReady: _isMapReady,
      isInitialized: _isInitialized,
    );

    _locationPickerHelper.initializeMap();
  }

  @override
  void dispose() {
    _selectedLocation.dispose();
    _isMapReady.dispose();
    _mapController.dispose();
    _isInitialized.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isVerySmallScreen = screenWidth < 400;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    // Responsive dimensions
    final appBarHeight = isVerySmallScreen ? 56.0 : 64.0;
    final titleFontSize = isVerySmallScreen ? 18.0 : 20.0;
    final iconSize = isVerySmallScreen ? 20.0 : 24.0;
    final locationPinSize = isVerySmallScreen ? 40.0 : 50.0;
    final coordinateFontSize = isVerySmallScreen ? 12.0 : 14.0;
    final buttonTextSize = isVerySmallScreen ? 14.0 : 16.0;
    final buttonIconSize = isVerySmallScreen ? 20.0 : 24.0;

    // Adjust positions for landscape mode
    final coordinateTop = isLandscape ? 8.0 : 16.0;
    final instructionBottom = isLandscape ? 80.0 : 100.0;
    final floatingButtonBottom = isLandscape ? 16.0 : 80.0;
    final floatingButtonRight = isLandscape ? 16.0 : 20.0;

    return ValueListenableBuilder<bool>(
      valueListenable: _isMapReady,
      builder: (context, isReady, _) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: appBarHeight,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: iconSize),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const Color(0xFF2694ed),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.my_location,
                  color: Colors.white,
                  size: iconSize,
                ),
                onPressed: _locationPickerHelper.useCurrentLocation,
                tooltip: 'Use Current Location',
              ),
            ],
          ),
          body: Stack(
            children: [
              OSMFlutter(
                controller: _mapController,
                osmOption: OSMOption(
                  isPicker: true,
                  userTrackingOption: const UserTrackingOption(
                    enableTracking: false,
                    unFollowUser: true,
                  ),
                  zoomOption: const ZoomOption(
                    initZoom: 15,
                    minZoomLevel: 3,
                    maxZoomLevel: 18,
                    stepZoom: 1.0,
                  ),
                  userLocationMarker: UserLocationMaker(
                    personMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.location_history,
                        color: Colors.blue,
                        size: 48,
                      ),
                    ),
                    directionArrowMarker: const MarkerIcon(
                      icon: Icon(Icons.double_arrow, size: 48),
                    ),
                  ),
                  roadConfiguration: const RoadOption(
                    roadColor: Colors.yellowAccent,
                  ),
                ),
                onMapIsReady: (ready) {
                  if (ready) {
                    debugPrint("Map is ready");
                  }
                },
                onMapMoved: (region) {
                  _locationPickerHelper.onMapMoved();
                },
              ),

              // Center pin indicator
              Center(
                child: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: locationPinSize,
                ),
              ),

              // Selected location coordinates
              ValueListenableBuilder<GeoPoint?>(
                valueListenable: _selectedLocation,
                builder: (context, location, _) {
                  if (location != null) {
                    return Positioned(
                      top: coordinateTop,
                      left: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 178),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Selected: ${location.latitude.toStringAsFixed(6)}, ${location.longitude.toStringAsFixed(6)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: coordinateFontSize,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),

              // Instruction text
              if (isReady)
                Positioned(
                  bottom: instructionBottom,
                  left: 0,
                  right: 0,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Move the map to select a location",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              if (!isReady) const Center(child: CircularProgressIndicator()),
            ],
          ),
          floatingActionButton: isReady
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: floatingButtonBottom,
                    right: floatingButtonRight,
                  ),
                  child: FloatingActionButton.extended(
                    onPressed: _locationPickerHelper.confirmLocation,
                    backgroundColor: const Color(0xFF2694ed),
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: buttonIconSize,
                    ),
                    label: Text(
                      "Confirm Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: buttonTextSize,
                      ),
                    ),
                  ),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
        );
      },
    );
  }
}
