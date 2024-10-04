import 'package:eye_muslim/alerts/errors/error_widgets/location_error_widget.dart';
import 'package:eye_muslim/screens/qibla/widgets/qibla_compass.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/widgets/custom_back.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorPalette.greyE8F,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: context.colorPalette.greyE8F,
            leading: const CustomBack(),
            title: CustomText(
              context.appLocalization.qiblaDirection,
              color: context.colorPalette.green215,
              fontWeight: FontWeight.bold,
            ),
          ),
          SliverFillRemaining(
            child: FutureBuilder(
              future: _deviceSupport,
              builder: (_, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return LocationErrorWidget(
                    error: "Error: ${snapshot.error.toString()}",
                  );
                }

                if (snapshot.data!) {
                  return const QiblaCompass();
                } else {
                  return LocationErrorWidget(
                    error: context.appLocalization.thisDeviceNotSupportCompass,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
