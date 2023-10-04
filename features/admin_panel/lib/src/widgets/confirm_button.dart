import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/admin_panel.dart';
import 'package:settings/settings.dart';

class ConfirmButton extends StatelessWidget {
  final Function() onTap;
  final String content;

  const ConfirmButton({
    super.key,
    required this.onTap,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, ThemeState themeState) {
        return BlocBuilder<AdminBloc, AdminState>(
          builder: (_, AdminState adminState) {
            if (adminState.isLoading) {
              return const Padding(
                padding: EdgeInsets.all(15),
                child: AppCenterLoader(),
              );
            } else {
              return GestureDetector(
                onTap: onTap,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: themeState.appTheme.secondaryHeaderColor,
                  ),
                  child: Center(
                    child: Text(
                      content,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            themeState.appTheme.textTheme.titleLarge!.fontSize,
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
