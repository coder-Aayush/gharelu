import 'package:auto_route/auto_route.dart';
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

// ignore: inference_failure_on_function_return_type
typedef Success = Function(String, String, LatLng);

@RoutePage<void>()
class MapPickerView extends StatefulHookConsumerWidget {
  const MapPickerView(this.onSuccess, {Key? key}) : super(key: key);
  // ignore: inference_failure_on_function_return_type
  final Success onSuccess;

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
      // context.showSnackbar(message: 'Tab anywhere to Select Location');
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
          floatingActionButton: Consumer(builder: (context, ref, _) {
            final String? location = ref.watch(getLocationStateProvider).maybeWhen(
                  orElse: () => null,
                  success: (data) => data.toString(),
                );
            return FloatingActionButton(
              onPressed: () => widget.onSuccess(location!, '', selectedLatLng),
              child: ref.watch(getLocationStateProvider).maybeWhen(
                    orElse: () => null,
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (data) => const Icon(Icons.done),
                  ),
            );
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: 15,
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 105,
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                children: [
                  const Spacer(),
                  Consumer(builder: (context, ref, _) {
                    final String location = ref.watch(getLocationStateProvider).maybeWhen(
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
                  }),
                ],
              ),
            ),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              FlutterMap(
                mapController: controller,
                children: [
                  TileLayer(
                    urlTemplate: 'https://api.mapbox.com/styles/v1/theaayush/cl6flf3vp000g15mv6mw99ewl/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw',
                    additionalOptions: {
                      'accessToken': 'pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw',
                      'id': 'mapbox.mapbox-streets-v8',
                    },
                  ),
                ],
                options: MapOptions(
                  center: LatLng(27.700769, 85.300140),
                  onPointerDown: (event, point) {
                    selectedLatLng = point;
                    setState(() {});
                    ref.read(getLocationStateProvider.notifier).getLocationFromLatLng(lat: '${selectedLatLng.latitude}', lng: '${selectedLatLng.longitude}');
                  },
                  keepAlive: true,
                  zoom: 18.0,
                  // allowPanning: true,
                  enableScrollWheel: true,
                ),
                // layers: [
              ),
              Assets.images.map.image(
                height: 45,
                width: 45,
              ),
            ],
          ),
        );
      },
    );
  }
}
