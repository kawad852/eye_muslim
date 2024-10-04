import 'dart:async';

import 'package:eye_muslim/alerts/errors/error_widgets/location_error_widget.dart';
import 'package:eye_muslim/screens/qibla/widgets/qibla_bubble.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';

class QiblaCompass extends StatefulWidget {
  const QiblaCompass({super.key});

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  final _locationStreamController = StreamController<LocationStatus>.broadcast();

  Stream<LocationStatus> get stream => _locationStreamController.stream;

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled && locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final status = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(status);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLocationStatus();
  }

  @override
  void dispose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return const QiblaBubble();

              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: context.appLocalization.locationServiceDenied,
                  onRetry: _checkLocationStatus,
                );
              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: context.appLocalization.locationServiceDenied,
                  onRetry: _checkLocationStatus,
                );
              default:
                return const SizedBox();
            }
          } else {
            return LocationErrorWidget(
              error: context.appLocalization.pleaseEnableLocation,
              onRetry: _checkLocationStatus,
            );
          }
        },
      ),
    );
  }

  
}
