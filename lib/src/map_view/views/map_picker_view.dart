import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/map_view/providers/get_location_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

class MapPickerView extends StatefulHookConsumerWidget ***REMOVED***
  const MapPickerView(this.onSuccess, ***REMOVED***Key? key***REMOVED***) : super(key: key);
  // ignore: inference_failure_on_function_return_type
  final Function(String) onSuccess;

***REMOVED***
  _MapPickerViewState createState() => _MapPickerViewState();
***REMOVED***

class _MapPickerViewState extends ConsumerState<MapPickerView> ***REMOVED***
  late MapController controller;

***REMOVED***
  void initState() ***REMOVED***
    super.initState();
    controller = MapController();
    selectedLatLng = LatLng(27.70169, 85.3206);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) ***REMOVED***
      context.showSnackbar(message: 'Tab anywhere to Select Location');
  ***REMOVED***
  ***REMOVED***

  late LatLng selectedLatLng;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    ref.listen(getLocationStateProvider, (previous, next) ***REMOVED***
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        success: (data) => context.showSnackbar(message: data.toString()),
        error: (message) => context.showSnackbar(message: message),
      );
  ***REMOVED***
    return StatefulBuilder(
      builder: (context, setState) ***REMOVED***
        return ScaffoldWrapper(
          extendBody: true,
          floatingActionButton: Consumer(builder: (context, ref, _) ***REMOVED***
            final String? location =
                ref.watch(getLocationStateProvider).maybeWhen(
                      orElse: () => null,
                      success: (data) => data.toString(),
                    );
            return FloatingActionButton(
              onPressed: () => widget.onSuccess(location!),
              child: const Icon(Icons.done),
            );
          ***REMOVED***),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: 15,
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 105,
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                children: [
                  const Spacer(),
                  Consumer(builder: (context, ref, _) ***REMOVED***
                    final String location =
                        ref.watch(getLocationStateProvider).maybeWhen(
                              orElse: () => 'Pick Your Location',
                              success: (data) => data.toString(),
                              error: (message) => message,
                              loading: () => 'Loading',
                            );
                    return Text(
                      location,
                      style: AppStyles.text14PxRegular,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    );
                  ***REMOVED***),
          ***REMOVED***
              ),
            ),
          ),
          body: Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  allowPanningOnScrollingParent: true,
                  controller: controller,
                  keepAlive: true,
                  center: LatLng(27.70169, 85.3206),
                  zoom: 18.0,
                  onTap: (tapPosition, point) ***REMOVED***
                    selectedLatLng = point;
                    setState(() ***REMOVED******REMOVED***);
                    ref
                        .read(getLocationStateProvider.notifier)
                        .getLocationFromLatLng(
                            lat: '$***REMOVED***selectedLatLng.latitude***REMOVED***',
                            lng: '$***REMOVED***selectedLatLng.longitude***REMOVED***');
                  ***REMOVED***,
                  allowPanning: true,
                  enableScrollWheel: true,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://api.mapbox.com/styles/v1/theaayush/cl6flf3vp000g15mv6mw99ewl/tiles/256/***REMOVED***z***REMOVED***/***REMOVED***x***REMOVED***/***REMOVED***y***REMOVED***@2x?access_token=pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw',
                    additionalOptions: ***REMOVED***
                      'accessToken':
                          'pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw',
                      'id': 'mapbox.mapbox-streets-v8',
                    ***REMOVED***,
                  ),
                  MarkerLayerOptions(
                    key: UniqueKey(),
                    markers: [
                      Marker(
                        point: selectedLatLng,
                        builder: (context) => Assets.images.map.image(),
                        height: 45,
                        width: 45,
                      ),
              ***REMOVED***
                  ),
          ***REMOVED***
              ),
      ***REMOVED***
          ),
        );
      ***REMOVED***,
    );
  ***REMOVED***
***REMOVED***
