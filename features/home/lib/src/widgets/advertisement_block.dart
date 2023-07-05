import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

class AdvertisementBlock extends StatefulWidget {
  const AdvertisementBlock({super.key});

  @override
  State<AdvertisementBlock> createState() => _AdvertisementBlockState();
}

class _AdvertisementBlockState extends State<AdvertisementBlock> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            gradient: state == AppTheme.getLightThemeData()
                ? AppLightThemeColors.gradient
                : AppDarkThemeColors.gradient,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'Version: PT-2/theme-and-navigation',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
