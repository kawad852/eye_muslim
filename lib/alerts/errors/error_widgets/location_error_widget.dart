import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:flutter/material.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? onRetry;

  const LocationErrorWidget({super.key, this.error, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.location_off,
            size: 150,
            color: context.colorPalette.green00A,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              error!,
              style: TextStyle(
                color: context.colorPalette.redDA0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            child: Text(context.appLocalization.retry),
            onPressed: () {
              if (onRetry != null) onRetry!();
            },
          ),
        ],
      ),
    );
  }
}
