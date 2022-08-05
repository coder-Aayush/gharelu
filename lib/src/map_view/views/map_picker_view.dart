import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/map_view/data_source/location_data_source.dart';
import 'package:gharelu/src/map_view/providers/get_location_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

class MapPickerView extends StatefulHookConsumerWidget {
  const MapPickerView({Key? key}) : super(key: key);

  @override
  _MapPickerViewState createState() => _MapPickerViewState();
}

class _MapPickerViewState extends ConsumerState<MapPickerView> {
  late MapController controller;

  @override
  void initState() {
    super.initState();
    controller = MapController();
    selectedLatLng = LatLng(27.70169, 85.3206);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.showSnackbar(message: 'Tab anywhere to Select Location');
      // ref.read(getLocationStateProvider.notifier).getLocationString(
      //     lat: '${selectedLatLng.latitude}',
      //     lng: '${selectedLatLng.longitude}');
      ref.read(getLocationStateProvider.notifier).getLocationFromLatLng(
            lat: '${selectedLatLng.latitude}',
            lng: '${selectedLatLng.longitude}',
          );
    });
  }

  late LatLng selectedLatLng;

  @override
  Widget build(BuildContext context) {
    ref.listen(getLocationStateProvider, (previous, next) {
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        success: (data) => context.showSnackbar(message: data.toString()),
        error: (message) => context.showSnackbar(message: message),
      );
    });
    return StatefulBuilder(
      builder: (context, setState) {
        return ScaffoldWrapper(
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.done),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: 15,
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 100,
              padding: EdgeInsets.all(12.0.r),
              child: Column(
                children: [
                  const Spacer(),
                  Consumer(builder: (context, ref, _) {
                    return Text(
                      'You are in: Sinamnagal kathamdnu nepal',
                      style: AppStyles.text18PxMedium,
                    );
                  }),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  controller: controller,
                  keepAlive: true,
                  center: LatLng(27.70169, 85.3206),
                  zoom: 18.0,
                  onTap: (tapPosition, point) {
                    selectedLatLng = point;
                    setState(() {});
                  },
                  allowPanning: true,
                  enableScrollWheel: true,
                  onPositionChanged: (position, hasGesture) {},
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://api.mapbox.com/styles/v1/theaayush/cl6flf3vp000g15mv6mw99ewl/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw',
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw',
                      'id': 'mapbox.mapbox-streets-v8',
                    },
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
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
